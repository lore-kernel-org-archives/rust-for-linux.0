Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.126.81
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793962063;
	b=ipGWrkAULuUQybzFT7jMBVDhNHSQKtjipMOu2sZjKAF6MdlAzeYg0JL4WwrLllLGXSfF
	 jOs7LT17J3OP0C0o14Q9qGiLpRKjf/u3zHtXa23LnykndN0cz9TQI6vxhjgbyGtFLkTaU
	 BEzD7cmGuULKGE4ix/roN8ThwSRgkZNkxaNOa0iR4fuPXTh5S41jZEkEFQSdWeZLI6uLb
	 xYXeJGVypeQw//9WLmMH0PDhelvZGdNQyBQX7vpXDA9RbxqJgZjpvrxqPpBH/6EkQR7tS
	 c58ioI+qxIe+yTqbA86sZ457ZrBadA0+XptKozbCC1aRzDgfu7hzQMgO+JgQpdmlyUg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793962063;
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
	bh=IL3H6rZijb49gdrSNDMemAN8blW2IdjcWiZwDMJvQ3k=;
	b=4ox6u62MDmPA4uWm1Cb3rFB/QfAFWRLl6/iDIJQsczJjZFZMrTI9F1okLqKoC2v88HDg
	 sOPJphiYY6ne27xIqN1CqCaSbxXunxwnTvqOnlEWt9rRBlucA3Wg15v/cQpBUxJ4NJ+Xp
	 UfBUF35sAq1toI9+7wPNWKK4pOIqweg2elJw5QX2xT9jvyceAgpayZwwnkKMEkFZ0kWL4
	 kgw02ZyT/Kj2ZMywnZB+Rme+foKsdO+72wFsGJochoiZ6UxrFwOBiljxcrG/ZSaCLrtd7
	 cM2Tw7Wsj6LZvW+OeGHXt/tjRICkHpKgGImmFiVAmAfM1AmfS5wgovMNJ+fJdoPS/dw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.126.81
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022081.outbound.protection.outlook.com [52.101.126.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FAD4606D82C;
	Fri,  6 Nov 2026 10:47:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FAD4606D82C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PyWkrT2RczqzJ2QK6A8defKVPwxGik660PPa29xcGE1xSEjKAlp2fWoCtnu2WIrtLxXLGSmWhc23awTHwE4pC5VMkhSLEKXmpp5D3poINk5C7dQ4kdBjUs+VbiG07u9+jlQ4kQre902riKh8zXDvEEoXwTTTojghLjEIr3m9ce/kJiuFZbbHDMJfqJmoUEr2kGRZyZgGdX393eRWUrMDVSQRWgLW/iI5rTFqKhxkntx6bn/+26IFPoxFCysLCAbE0lQ4nbApSdqvSY4fDl6Li63n2oSxMpnltVPmc9+LDHl5lcXIW8plspPIdU8LHn5/cpXcgDrMT/myQj3bEWmJkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IL3H6rZijb49gdrSNDMemAN8blW2IdjcWiZwDMJvQ3k=;
 b=bf+jUF3h3hlc9DRccqfnOSttqlAxQWWgeYCBMfO2ih1Oqs5lFVUNFA0ic8Ui0XcLr97NIeeFVQKUbaplJ46h6IQYr9LbNQF+age8+B0d+z8VS6hfzq7WWNOraZKn4DaaAuiTqi4Mi+VgHnU30wwuTCgt/FxQ6qWTrPznnamaeuuxJT+WwcDdmqWrN9NA5VZdNN685VS7eGRG3M290bRFVOnheCX7k64rrUQ5bL/PGO72AeJVbxf/AVp5w/bEhuvoeeFfbg4dj2PF/lXxC/u85o99IjuN4RC+O3gF/4/Izbo0Iy1fQkee4CVJEg5BCdsIvGZs/Iailq+40JYYaqCNFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from JH0PR01CA0002.apcprd01.prod.exchangelabs.com
 (2603:1096:990:56::11) by SE1PPF0B96CE885.apcprd06.prod.outlook.com
 (2603:1096:108:1::408) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.5; Fri, 6 Nov 2026
 10:47:38 +0000
Received: from SG1PEPF000082E1.apcprd02.prod.outlook.com
 (2603:1096:990:56:cafe::18) by JH0PR01CA0002.outlook.office365.com
 (2603:1096:990:56::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Fri, 6
 Nov 2026 10:47:37 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG1PEPF000082E1.mail.protection.outlook.com (10.167.240.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 10:47:37 +0000
Received: from cix (unknown [172.16.64.42])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id A49B34102E6B;
	Fri,  6 Nov 2026 18:47:35 +0800 (CST)
From: Cunyuan Liu <cunyuan.liu@cixtech.com>
To: boris.brezillon@collabora.com,
	steven.price@arm.com,
	liviu.dudau@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	gary.yang@cixtech.com,
	fugang.duan@cixtech.com
Cc: daniel.almeida@collabora.com,
	aliceryhl@google.com,
	p.zabel@pengutronix.de,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	robin.wang@cixtech.com,
	cunyuan.liu@cixtech.com
Subject: [PATCH 1/3] dt-bindings: gpu: Add CIX Sky1 Mali support
Date: Fri,  6 Nov 2026 18:47:33 +0800
Message-ID: <20261106104735.1651267-2-cunyuan.liu@cixtech.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261106104735.1651267-1-cunyuan.liu@cixtech.com>
References: <20261106104735.1651267-1-cunyuan.liu@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E1:EE_|SE1PPF0B96CE885:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: dfbffca3-2181-4151-a6a7-08df3bf35f8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|7416014|376014|36860700016|23010399003|10067099003|22082099003|18002099003|56012099006|261026140227099003|261026121527099003|261022105027099003|261028144727099003|261021121427099003|261102123227099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	QE7OnW5pScWmNhYDgJwdNHaV5PUlDmIovamEuTH54JHcU9gDlaSPoU7dgx0uC+2lbOZcd8MHRrp20TZxA4wZS/nrJjO/3Y6xUuFjMVLQCw8w7t1RyP+7lhG3T9a7EhOBkvnXq8lLxbd3FCP8IkqZ5zMYf/cLgCXeLsGcLJ70ez4F5O0liG6f40Bu4dafkxe9YF4QwR2mW+d+QAX1zHQkBeoHMaoA/+AmjUYzv4wLVER/9bQuK1R6wqmf5YZNluA1/YgfgA2EloBoCH37E7zuK4NlMbJlUcYoMUI1xjEmXoVkTnVEKRwpWL4h8DDrZ4+1zkwM/5zxT02H1o7MfF7w1gQjYjQMilc72g9CgEepbnt0E5KvbMyd/dsXMZjnZMTRBXNkqQpZmyATkGSoRihon9PTLlVCITl+2Aq5b7GutbHdXpV8tEB1XodX26UVIli6zOmMQLh7GukrEK5r0/UCg1W795o0qX0gjNJnS5xzZZ6MD6a30KWwaIzqdZbYqRBhwZu83POtMxsMJPQXG3JjkWWUMsVB4v4QjGhecEGp14jlmR3Jzxg5/SX1fCsWEfezcCfpxyY64TnRDKBfJFhFwnPAaF3V7K0cQPGppsyj3Yr2be2F3m+Xw1Z91MiO7aLghdoQ2SufQI5FUEH9J1dpg0kYS67I9At4eX07Zs35CBru3kU8ZuMbxPy/3sVlCOC3+BrLhVyPcm9Sqku8sbzB/A==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(7416014)(376014)(36860700016)(23010399003)(10067099003)(22082099003)(18002099003)(56012099006)(261026140227099003)(261026121527099003)(261022105027099003)(261028144727099003)(261021121427099003)(261102123227099003)(261009223027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	UR8Ck4kVJBZs7uqiq7viKmVTHbDr7T50tRUPWbTzEvspBRaSBX4+CdBVWFiXLlOKsE/UEPNNqU4Zwv/ZmfSDR0gD+wDNvtg13/MxywhCvZcxg3PLRUP6GCuUzTCjZRROLyVMGYY7snp5QPJRgnvAtDF00CiOCJUkf4kgvcFSNsfXg8U/OB/q7ev5sJ9ChJVEUo7LrT9arln3NkvHad/gvgM1VAJ4D9O6+6wu2WuqUvlG/CUYWO91vKN9I7t3vDo1eRseDQI6+cLZwcUkRFGaob3XdREgkPGAN0tId8QwO8goY5z59LjS9AA9b6vH+qu4yPtpd9HIvW6jGLIDXaoFda63O8hhtWopcgY7wLscdMwgA/N6K+Jp02yRVI9hNLQWdkQPfAO7g38X8kh+yBLN1xnJ6Liif09lPpDB8c8/Ap3JozCIGUkHosurXGJjl3L0
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 10:47:37.4222
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dfbffca3-2181-4151-a6a7-08df3bf35f8e
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG1PEPF000082E1.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE1PPF0B96CE885

Describe the Mali CSF GPU on CIX Sky1. It uses core and stacks clocks,
an external reset and a GPU power domain.

Add the compatible string, resource requirements and an example.

Signed-off-by: Cunyuan Liu <cunyuan.liu@cixtech.com>
---
 .../bindings/gpu/arm,mali-valhall-csf.yaml    | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
index 8eccd4338a2b..a93acc6d91ec 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
@@ -18,6 +18,7 @@ properties:
     oneOf:
       - items:
           - enum:
+              - cix,sky1-mali
               - mediatek,mt8196-mali
               - nxp,imx95-mali            # G310
               - rockchip,rk3588-mali
@@ -51,6 +52,9 @@ properties:
           - stacks
       - const: stacks
 
+  resets:
+    maxItems: 1
+
   nvmem-cells:
     items:
       - description: bitmask of functional shader cores
@@ -146,6 +150,34 @@ allOf:
         - nvmem-cells
         - nvmem-cell-names
         - power-domains
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: cix,sky1-mali
+    then:
+      properties:
+        clocks:
+          minItems: 2
+          maxItems: 2
+        clock-names:
+          items:
+            - const: core
+            - const: stacks
+        power-domains:
+          maxItems: 1
+        power-domain-names: false
+        mali-supply: false
+        sram-supply: false
+        nvmem-cells: false
+        nvmem-cell-names: false
+      required:
+        - clock-names
+        - resets
+        - power-domains
+    else:
+      properties:
+        resets: false
 
 examples:
   - |
@@ -196,4 +228,23 @@ examples:
         power-domains = <&gpufreq>;
     };
 
+  - |
+    #include <dt-bindings/clock/cix,sky1.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/reset/cix,sky1-s5-system-control.h>
+
+    gpu@15010000 {
+        compatible = "cix,sky1-mali", "arm,mali-valhall-csf";
+        reg = <0x15010000 0x480000>;
+        interrupts = <GIC_SPI 237 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 238 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 239 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "job", "mmu", "gpu";
+        clocks = <&scmi_clk CLK_TREE_GPU_CLK_CORE>,
+                 <&scmi_clk CLK_TREE_GPU_CLK_STACKS>;
+        clock-names = "core", "stacks";
+        resets = <&s5_syscon SKY1_GPU_RESET_N>;
+        power-domains = <&smc_devpd 21>;
+    };
+
 ...
-- 
2.53.0

