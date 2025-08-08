import bpy    #Blender 核心 API 导入
from mathutils import *; from math import *
import numpy as np  #导入科学计算库NumPy   并赋予别名np
 
dict = {}   #声明一个空的字典
 
mesh = bpy.data.meshes['星見雅']  #制定网格体
 
mesh.calc_tangents(uvmap='UVMap') #  对网格体生成切线 生成切线依赖第一套uv 
 
 
def  included_angle(v0,v1):      # 用余弦定理 反cos直接能得到夹角
     return np.arccos(v0.dot(v1)/(v0.length * v1.length))
 
def  unitVectorToOct(v):        #uv是俩个通道 法线是三个通道 三维向量投影到正八面体
     d = abs(v.x) + abs(v.y) + abs(v.z)
     o = Vector((v.x/d, v.y/d))       # 初步投影到二维平面
                                       #一般法线都朝外时可以只存xy 因为z一定是整的可以开平方根来算
     if v.z<= 0 :
        o.x = (1 -abs (o.y) )*(1 if o.x >= 0 else -1) 
        o.y = (1 -abs (o.x) )*(1 if o.y >= 0 else -1) 
     return o
 
 # 遍历一下顶点的位置作为键 塞入字典
for vertex in mesh.vertices:     #mesh.vertices 表示网格的顶点坐标数组 此时vertex直接表示一个三维坐标点
     dict[str(vertex.co)] = []    # vertex.co 顶点的三维坐标（mathutils.Vector 类型
        
for poly in mesh.polygons :      #遍历网格的每个面（多边形），poly 表示当前处理的面对象  mesh.polys 存储网格中每个面的信息
     l0 = mesh.loops[poly.loop_start]     #poly当前面的起始循环索引（即该面在 mesh.loops 数组中的起始位置）
     l1 = mesh.loops[poly.loop_start +1]  #获取当前面的第二个循环（即第二个顶点角）
     l2 = mesh.loops[poly.loop_start +2]  #获取当前面的第三个循环（即第三个顶点角)
     #mesh.loops：存储所有面的循环数据，每个循环对应一个面的顶点角（Corner）​，包含顶点索引、UV、法线等信息
     #l0 表示当前面的第一个循环。
     
     v0 = mesh.vertices[l0.vertex_index]  #mesh.vertices[索引]：通过索引获取顶点对象
     v1 = mesh.vertices[l1.vertex_index]  #l0.vertex_index：从循环 l0 中提取顶点索引
     v2 = mesh.vertices[l2.vertex_index]
    
    
     vec0 = v1.co - v0.co 
     vec1 = v2.co - v0.co
    
     n = vec0.cross(vec1)     #  用顶点位置计算三角形的俩条边  叉乘得到三角形的法线 归一化一下
     n = n.normalized()
    
     k0 = str(v0.co)   # 把三个顶点的位置作为键 往字典里面存法线和平滑权重 用夹角加权 写一个计算夹角的方法
     k1 = str(v1.co)
     k2 = str(v2.co)
    
     if k0 in dict:
        w = included_angle(v2.co - v0.co, v1.co - v0.co)
        dict[k0].append({"n": n,"w" : w})
     if k1 in dict:
        w = included_angle(v0.co - v1.co, v2.co - v1.co)
        dict[k1].append({"n": n,"w" : w})
     if k2 in dict:
        w = included_angle(v1.co - v2.co, v0.co - v2.co)
        dict[k2].append({"n": n,"w" : w})
        
        
for poly in mesh.polygons :  #三角形的绕向不能搞错  绕向决定三角形的正反面
    for loop_index in range(poly.loop_start,poly.loop_start +3): # 遍历面拐
        l = mesh.loops[loop_index]   #定义面的顶点顺序
        vertex_index = l.vertex_index  #顶点序号
        v = mesh.vertices[vertex_index] 
        smoothNormal = Vector((0,0,0))#标记一下平滑法线和权重和
        weightSum =0
        k = str(v.co)     
        if k in dict :    #去字典里面把法线和权重捞出来
            a = dict[k]
            for d in a : 
                n = d["n"]
                w = d["w"]
                smoothNormal += n * w  #把法线加权后加给平滑法线 权重和也一起加下来
                weightSum += w
        if smoothNormal.length != 0:  #如果能加出不等于0的平滑法线  就把权重的和除掉 再归一化一下
            smoothNormal /=weightSum
            smoothNormal = smoothNormal.normalized()        #如果平滑是0  说明俩个顶点完全反向 不需要平滑
        else:
            smoothNormal = l.normal  #这样得到的平滑法线是模型空间的，不会像顶点法线一样被骨骼蒙皮
            
            
        normal = l.normal
        tangent = l.tangent
        bitangent = l.bitangent
        
        x = tangent.dot(smoothNormal)
        y = bitangent.dot(smoothNormal)
        z = normal.dot(smoothNormal)  #构造一个tbn矩阵 把它转到切线空间
        
        uv1 = mesh.uv_layers['UVMap.001'].uv[loop_index]   #把它存入第二套uv里面
        
        uv1.vector = unitVectorToOct(Vector((x,y,z)))
