Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.127.142
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794226153;
	b=JotjygldYM9OGSsvV8AzzEcd/4gtX7C+N7q+gB1QRcgXH31Ko9CHIbmr4FHF5zEe4n5I
	 99NQ+/L00KRmo2XeIPONRyZQWqknK8if31Wnz54JW4mxrUxwyUryIt1EditF1AGriZnPj
	 AVRcmQDR0rxRoPBXsqZeohlqOB0b+wUTxotHk3TBNjQnHpp3Zz10IOrl2LXyr7/Nu3LoA
	 07MNtV5evU+NgxhACxdfAr4gEw1aWCZZBa7nhxRiu6BrldMh/UtypQMaY7e4I4ppb9kuI
	 iIE1CLApyvhV6dIfkFD3hHhwXQcGr8b/ql6oCkgwzqBycDk/qPrD9oG7S7QvNGFO8aw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794226153;
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
	bh=r4+pWU1nb58F5dsMvOA4RjP527RUqPlN/xdLexEiAcs=;
	b=ADhmAJCT8Sihv0X3EucvpD6S8c+q/lLW0QNuchA7koQf4uakjnbmO6mNCYD3V+HYcdGm
	 7DLb5e7md+bKfxl7boYOFVIvkv9NN0CRhL1OqmZupksC29RkiVhgp5k7KzzcbaK6PF8T7
	 SmAXX6RmRWaVcy3YYBiHs8xI87gHWgwyBP6k6B81L4tr0MfwwjambvIz5l/eyyQMzjyS7
	 B3/qJOCdcFqnn+VINcSkgjNHxpGvI1s2CyDUPiR3WVHBwJqvIrYKL9fdLq2kEueZtho9p
	 Q6xFR9Fiv+fVah7CGdOQiaogpp99+BCOMYUH2sI+hwQaP7nBodN+Bcn/VtF86T8k6Ag==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.127.142
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023142.outbound.protection.outlook.com [52.101.127.142])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C019F606A325;
	Mon,  9 Nov 2026 12:09:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C019F606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pOA0ba/p4Vi9fqbAoIjgwgsR7jraPHhDq1snkSPAkuEVGNpNxqONJcuTqZdj0v8VJtipmXAVCm0u3VWBwj+wsp+0arOdfdbJVYM1WoIPalsRw4JKVE9PNdCjeirLgiipqBf5m3GAdQ7det8fPCJuQoa0XvsvZpJ6ER3O24lDJ0Lui7UcaMLP185DwJQLt51EqFD6vK6rDFXfsSZGVqQVbS/Jz2sNkeeR41Nwi5+aVKHLqYE1xvu8A+3K8oCBajM0gY9KQYxI0Zjqgi9qR2WZgZALJGotk1O5dSizsPG+g0K8iMJYokQCbeLzMfACpDAqSugcw4jaEzZuyiP6KRURpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r4+pWU1nb58F5dsMvOA4RjP527RUqPlN/xdLexEiAcs=;
 b=aDwrPEqmRfoyYk2PFM3AvnoSsxZZfZF43jJKCFe7cMmIUmyMieQI/kH64nPkHikBgZ2FpUZxbFpPyLi1216E2E8El2aFTiT04o4Rvy3ncIK8xu8pzc2se0Dy3Cn0KJtJId91HYJ8UNouBsyPlntt010bzE6F3uBK/mMNMx3k2W/LUB0RSsMpicXo41Mg0zcv1xQDCA9DeDuTWj/Jw4I77DiR2PR6bQz74M8zU0VKfaRwNMKymPsAeYfEJp7hNMTSVuBOBKXBakIKOLIt6+9BkqqADDKNmhiPJY7cK5pj77rs/NQ9aALUhtQrDOKX9DSbPllfQSHHANgB6HSOI618RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SG2PR04CA0216.apcprd04.prod.outlook.com (2603:1096:4:187::18)
 by JH0PR06MB7179.apcprd06.prod.outlook.com (2603:1096:990:9f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Mon, 9 Nov 2026
 12:09:04 +0000
Received: from OSA0EPF000000C6.apcprd02.prod.outlook.com
 (2603:1096:4:187:cafe::34) by SG2PR04CA0216.outlook.office365.com
 (2603:1096:4:187::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.13 via Frontend Transport; Mon, 9
 Nov 2026 12:09:04 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000C6.mail.protection.outlook.com (10.167.240.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 9 Nov 2026 12:09:03 +0000
Received: from cix (unknown [172.16.64.42])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 3D1474102E75;
	Mon,  9 Nov 2026 20:09:02 +0800 (CST)
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
	cunyuan.liu@cixtech.com,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 1/3] dt-bindings: gpu: Add CIX Sky1 Mali support
Date: Mon,  9 Nov 2026 20:08:59 +0800
Message-ID: <20261109120902.125242-2-cunyuan.liu@cixtech.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261109120902.125242-1-cunyuan.liu@cixtech.com>
References: <20261109120902.125242-1-cunyuan.liu@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: OSA0EPF000000C6:EE_|JH0PR06MB7179:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f6674c06-1f7a-4a55-43af-08df3e5a3f71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|23010399003|82310400026|36860700016|261021121427099003|261028144727099003|56012099006|261026140227099003|261009223027099003|261022105027099003|261102123227099003|261026121527099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	stcez+NTsNBt12hQurTBf7Tf2H2T3cFNarzs50MzE3xeRLWrob1mAoyvy2uQrDWuiiuQ8xic/uEdypTitmWbVu8hcX//uFB7jVkJGVyWxa6vPMI58/nby1GOlKRZq1Wq9HcLTdgNg1fnEa7/3bRiSI7IRyRA0jwLtuzfsN+H6QXh0eOkm0vFCiQdZfwVywPK1OX4MGZWAyfpBaeLinCCSsLwgB/ALlUvWM6E//40+PgFI8J2ZDjsYLg2s/KI+Z/wdPnr/wFQSTdW6/wMtvxP8iK7VMULY+JcYRswGhgMkHNiNiydiYBipuxce2s8kuyzZIGOYTpAxzrBVQVI3jHFSzJWAZ3DfEMxPUgUk4MXMOtr6tqRQMe7WJ8dZQqpzukZfSELnUYh+HULrxLU4Xk41dZeLAVNl4G+Am7XTJB20/fNFrl73UeSuXZPaoXMt3GUy+gshPoxEASAnW3yTA/ROxt/lma4URCZxQjP+MVZcHdP7nt0KgNaosggE9CqPeI8wmlL8lm33tm0SKQcV2zHMVxB5sQjhjgD6G239qZ0Fsz7kvwp8mOBG8eJL1+8F1wnaa2AuennIzgmy/E+S1de4JRuhseNxx64egIfUZrpIHR/qjVyl1UenINBfIZoV6nZ78vBD/StqtKuB8FwqjxEsqvD3IQGtoOUmrBovE899YYC7HCj56KWS0RJH7mpDqFFyGr3JbzONn4kBCUT/yNOeg==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(23010399003)(82310400026)(36860700016)(261021121427099003)(261028144727099003)(56012099006)(261026140227099003)(261009223027099003)(261022105027099003)(261102123227099003)(261026121527099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	vCmT5b9vuSy4qybGEHMG1Ao1U8cxhAze5QfuQOj52iNAQ71xCvNqJXUKSFlSRn6ejfgfeQAkWf6AeDaObrXTkoeeIn/Qji+N0evvgxFSh/1RFtVhyeuD1UzVItvzpqAhlGn8LJIf7fwJfB8ryy2uisraq54g3H40Hyp4Q030yQ7rg49pi3PCpBjIzWI9XU8hj+yTW4Kq6mARrGJ2QCP4QlnHwK20/uFIvS4Q9qQQdAjS26Dfwf3G+P8Q+9vmcvHUAxJq01EIxm63Irf5ThI6Vn6oRH3Ndzlbl+d1zrUO5O4JdTeNtzo+7N/1Q6QbLtOX62FGSSgI/eNIG/950CWaQwLVtsa1Nir+Tf9VtUqOzRlZTMRhUxo+jYznKVdb5/Oihufhx25vCCvzHz0vJoNpwhy/SxagG7UpdnF+PPvo6qHvkbXfUgm/GRAukf9AUdVt
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 12:09:03.9651
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f6674c06-1f7a-4a55-43af-08df3e5a3f71
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000C6.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB7179

Describe the Mali CSF GPU on CIX Sky1. It uses core and stacks clocks,
an external reset and a GPU power domain.

Add the compatible string, resource requirements and an example.

Signed-off-by: Cunyuan Liu <cunyuan.liu@cixtech.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
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

