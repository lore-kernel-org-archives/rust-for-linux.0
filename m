Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.44.135
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795091938;
	b=T7e+uUOlk9lqqwNS+oP/NrN9MaYSkCd5qtrsdmJeNeBU9g+/Hku6kxg8hnkSHrhXKy9O
	 cHAkO0i3xS02pUPBo9lIWm9t77emLDGyzXk4IrvuZ7hbHvonzBdj9pzOL3POd9Y0i9d1D
	 skjiX+vv4TMYyQfVMJ847NtlEm5QUowVrUtA/b5NnqLUJX/TOU//0Jthu6J8iTlxaAKbQ
	 KbWFsUK+QImckSBmj2LdrRXTu4Hon5xrtQkV2sz3zjD52cnGIWV2BHx/hGX5IY8S0xsvd
	 ylhwtYr3FxXJ6i1A3qnhOKz4K51HHEiwokNGr9WZsOJaVr1hbDTCtVEddz9Yx0yh2ZA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795091938;
	h=DMARC-Filter:Received:Received:X-MS-Exchange-Authentication-Results:
	 Received-SPF:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:Content-Type:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=WaphXpdje15vPuPpOc/TXe+1Dbcdmx1kaXbu77EgDj4=;
	b=g12NwWVh9iyBq+CM3cvIhqD/xEg67Uf/PbNUNocQcs31IkBLWsra3369WQ2nhKKnyESA
	 9xu9s57wxatJW4zilovw/p5UNFCU03pYNKa/KBp1etAjv0YL+Kfc0vWDm1PDlBPxStPFO
	 Rv1FokxZRZjNFDmWlkW4qKljIWmTol00ehdpgMhg8qtcyKfHAxNeoPVPsLBg4iMS567am
	 cBkNvbXmrk96bHY0KKGs6Qhcnb4JroMINVZo32TxLPoVRW/ymZl31SNEbMQVWtTzx3mKb
	 1vs9w9qrMc03A59WUv6Uq2FV2neABMZOFbBFAIKZOKxsXB1FI/CryS7Oy3ER71g2vJg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.44.135
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023135.outbound.protection.outlook.com [40.107.44.135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA97606A324;
	Thu, 19 Nov 2026 12:38:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCA97606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dr/26OclQZn34nYOA2+miGC+fV3XMxrHfIW8MK0ODANmYfvADDE2O7d8HyPP5mblLLi5O/Vz+/uIJ4zD9I3FIimeU+bZIYD1T2m5PXbSFs/Dv93Jjv57ddkCH+eH2kziDNGh3klvYK2fSYb3ES2IgnfyL015SKq74VFh4v2RSjnkjaO8TkXUbIzANl70UW4D1N5j/VuyB+qa4dO/tMPWiO+lNV7LR4NpSAFbd8XVsiIthSJXAkbeuavnrw5xbcEFijDRU5GGcdlOndTkSbkhp6vcJzK3AW+gD6U5qv7E3Qej8CasDZNq5hINk0xYchR9kjy9RGoQVaiGwgw8Z/3myQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WaphXpdje15vPuPpOc/TXe+1Dbcdmx1kaXbu77EgDj4=;
 b=PE91I6yRg464f0SIaipN+Mfz/gwhLE+lohj4WEP2eta77jGjghgiV4G8XZg8ypFNMLxszzxm2tpDqnmpG+RtdomoRDRHkT1FUUXHTo20d6eW2QEuBJYNyJ28WTQT8//S9fZmV0fZBQODwJ4EhklbWqpDyaY+qtChrI2/xRbe7KUPxe361xNHX5Xp5ZVD1ToGGxMC7mDjfxG9lHkhiVbphs4P72Sm72/ZqOTy8g0xbIU5JS/+lqKIl0XPakSZc2DhVNmlbb/O1TNJ4/muydqXNx22wzymHnpeAdJT/kLbonxipgsFl+kOsaCIZtIVGhxxueyl1LAMTt6ZWZGoNxZoxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from JH0PR01CA0187.apcprd01.prod.exchangelabs.com
 (2603:1096:990:75::22) by SEYPR06MB7000.apcprd06.prod.outlook.com
 (2603:1096:101:1e3::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.1; Thu, 19 Nov
 2026 12:38:53 +0000
Received: from SG2PEPF000B66CC.apcprd03.prod.outlook.com
 (2603:1096:990:75:cafe::8d) by JH0PR01CA0187.outlook.office365.com
 (2603:1096:990:75::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.12 via Frontend Transport; Thu,
 19 Nov 2026 12:38:53 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CC.mail.protection.outlook.com (10.167.240.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Thu, 19 Nov 2026 12:38:52 +0000
Received: from cix (unknown [172.16.66.176])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 52B9E40920E2;
	Thu, 19 Nov 2026 20:38:51 +0800 (CST)
From: Cunyuan Liu <cunyuan.liu@cixtech.com>
To: boris.brezillon@collabora.com,
	steven.price@arm.com,
	liviu.dudau@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	gary.yang@cixtech.com,
	fugang.duan@cixtech.com,
	daniel.almeida@collabora.com,
	aliceryhl@google.com,
	p.zabel@pengutronix.de,
	daniel@fooishbar.org
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	robin.wang@cixtech.com,
	cunyuan.liu@cixtech.com
Subject: [PATCH v3 3/7] dt-bindings: gpu: arm,mali-valhall-csf: Add system-cache policies
Date: Thu, 19 Nov 2026 20:38:46 +0800
Message-ID: <20261119123850.2994625-4-cunyuan.liu@cixtech.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261119123850.2994625-1-cunyuan.liu@cixtech.com>
References: <20261119123850.2994625-1-cunyuan.liu@cixtech.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CC:EE_|SEYPR06MB7000:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 9284e03d-b6eb-487f-dedc-08df463a11cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|23010399003|82310400026|36860700016|921020|10067099003|56012099006|261026121527099003|261022105027099003|261021121427099003|261009223027099003|261102123227099003|261026140227099003|261028144727099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	HsCuf7GMgP7cB+L4k5x+H+4SE8fLWPFi4qFjBwwA78FIbx2xM4TxLdXWE6fvOSytYowKbliBu8UHgoPo/AZ018sUgmNkL0wIHekF2IVHVYzWgCstwrDQ8LcHAfX/romUuiPQT+FEEQalmdyoCr3qJrNA1TEJ4VC1rfoHcK2lVLTxs30G7YFkqXxc3Rwpsr6bBEVBs2ksgx5NrLFlIBn+grqNgtUs6kS/9/W4xVqWu2OE3jifWX37SINqdmDaCoBQzbzb8NmS2uj87rnTwoiKoCHOUGP1mZXXcFRCpOdn2txjJzt9Ny+mcbaqAU2hESz7AIZOKK3lAXCCxhmiJVeuO8+y14S8Wym9go/NXcaws8qWmsGftwq4K8BVYuvdb3v8a7MimIeu+BRnBxuQkwduRrLcYqRvf9FlakZGrx6EsHpxPeGbRJNnGIPtIPQy9keDXtUMD4y828UFSW7qu7qglxz/yGMcMHzGqegBXDffmn1GdQnSYf/RcVI+mlsiSmjXqjkEqYW/WPD9JDutuFeDGb/HjdsjBw3nRCybXZO43xQT9xWot0pEjDysPGFLFN3lRnyuaPapupSvyCQujlf2arX8HLepp9tCGVy5wPz3Pm32WNLHcvlqUW15FClP0RuhmviKZiZxYoRew7x8i1m2ZkrDYOLnDJNE+zOJCzYhhmlkvr5krvJMqsw5lrkPfrQ6WSr4wES0+rwt4zV7oUwB3Zvsy/JhonhflU9hz5bC/EGokhQgmXwlkLHMiYEyKA+s
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(23010399003)(82310400026)(36860700016)(921020)(10067099003)(56012099006)(261026121527099003)(261022105027099003)(261021121427099003)(261009223027099003)(261102123227099003)(261026140227099003)(261028144727099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	5W6l28nhQvZZpSnyKe/Lbb3pYlX5L7N5NeExZ+Ny76d4+EhE5voFzZvI0MBF84yDjD/BYJjrhZ47rFNRJIIvCr5E7iBBiB2FK+L39/eDVmjUf5afyEKL38bDgHWtK0WODRS3RmzzkVzy6GKMReJsJxQOfCwpb+sbWmFAu/EXv1OSRISTJ/pmZ9rQPygSCu1Uz0FSrGY5ypK0AO2644GVEJ0vDG5y/ZPkta9YtRE+ZshYf5yd5xaOJZudQKVLJ0J7QM4OOICvy76aF2isIi4alwQ9ymJn1lt+EDyGJwTK7Elv0KwN70gz2AFyL1QDK35HUUBcyADwQQI3doJuV0p8byPlPOE2DVZBOWimGJjr6kEK4KVOqNNrAmF3HpXBC6ueecPf+EfjZ1c54I0QgQHlQ+Co/yimDmxZYQE46Vz1mKURshl2AvHvFkI1ibg2I4EY
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 12:38:52.2551
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9284e03d-b6eb-487f-dedc-08df463a11cf
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG2PEPF000B66CC.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB7000

Describe system-cache allocation policies for Mali GPUs with SYSC_ALLOC
registers. The policy depends on how the GPU is integrated with the rest
of the system and belongs in DT rather than a platform table in the driver.

Use entries containing a source ID and separate read and write policies.
When the property is present, omitted sources use L2 allocation. Without
the property, the driver leaves the register settings unchanged.

Signed-off-by: Cunyuan Liu <cunyuan.liu@cixtech.com>
---
 .../bindings/gpu/arm,mali-valhall-csf.yaml    | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
index 8eccd4338a2b..4d50427edd87 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
@@ -97,6 +97,30 @@ properties:
 
   dma-coherent: true
 
+  arm,sysc-alloc:
+    $ref: /schemas/types.yaml#/definitions/uint32-matrix
+    minItems: 1
+    maxItems: 32
+    items:
+      items:
+        - description: GPU internal source ID
+          minimum: 0
+          maximum: 31
+        - description: Read allocation policy
+          enum: [0, 2, 3, 4, 5]
+        - description: Write allocation policy
+          enum: [0, 2, 3, 4, 5]
+    description:
+      System-cache allocation policies for GPU architecture 11.0.3 and later.
+      Each entry contains a source ID, a read policy and a write policy.
+      Source IDs must be unique. Reserved source IDs and access directions
+      not supported by the GPU must use zero policies. Policy values are
+      0 for L2 allocation, 2 for never allocate, 3 for always allocate,
+      4 for partial allocation and 5 for L2 partial allocation. When present,
+      all source policies start at zero and the listed entries override them.
+      Omitted sources therefore use L2 allocation. If absent, the register
+      defaults are preserved.
+
 required:
   - compatible
   - reg
-- 
2.53.0

