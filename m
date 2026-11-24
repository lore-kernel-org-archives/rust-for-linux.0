Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.127.143
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795501049;
	b=PaGwWeMPb3fp+ygM4q4X0iGmm87lqMe7lxSBf5SyY7++XimA430OdDGtSCHHXoZ3oUom
	 u0mnP0eHPA5LfmZKCmIThIu0JpqC/I4eJSJJ4+z+lvfLFHOD1P16XejlXgatIrdo1DJ5J
	 SvtpLhLXWtiIErGHJgABQz9qG3nFEl/7vRfTstU/3RbseIRmGeIEWREahC8LSEqhqzL4X
	 /TT18C2lwzZwqFJm68E4YN22AL9J4lUwwafvdn4wjX0aAVkGNEExa59Nu5nfmgBStpU6j
	 pfUf9gfn5PXwJY/2F6DG+owMX04lFKA97ObJZpnZ6lPrjDsLEt0YEXYUJKCHvYRKk3Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795501049;
	h=DMARC-Filter:Received:Received:X-MS-Exchange-Authentication-Results:
	 Received-SPF:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=EC1SwcRnB3qHtnUS6OrmTOLXoja38qTpuQD344gSjAk=;
	b=ZR7rZ6ygUtmOB1LlL94Ras0WX128J/y+L2m0/tVFnpmzQ8umSfW4+rXCz6xe52InJZ1i
	 I76GShhnxMcL/vnf4zM541+4aZb56L1EyN7csBpyR8nyIon+a9ouWyjtYrUfg9giRtJaB
	 jUzAGc98EZe/eS79uBCvsQSfeWFCel2oScDyoiHLzGWoRO4T3k+Nkmt1/T7q8AB/KkueC
	 MzI0lY1qavZ/Gs6vZzTHhieVrNRxb4T7OlO9gcdsJZSaMZL2oqnVGCgZo/SL+GH3YPpCh
	 2sWo7cCwCbr6StVR7sstgLgM/2wCkwK2ZbntggGHc9aAmep1EE6J8GaZGBaGk63QtAQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.127.143
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023143.outbound.protection.outlook.com [52.101.127.143])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF9D606A321;
	Tue, 24 Nov 2026 06:17:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DF9D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iDzo75pPBOQVifFr52WvuspjAFBYKZh+IYyjppbs6+DVjg45Y7B6BenQkupjeYHtQybXFWtP5sOLS0azAd9zFfEsNHn11N1bnXYDhHwnNcCMZ91KWJK6p5/dRduXWzZjc+AFkyy4q8taWXlURWvS9uhgIWHQtgIAZ54L2zihq1H1c1BpwN/bqh1C/aGxdERohU8qisEo3NazkuCSDbbwC4/JKUIeCUyiLkzItSvB62yBo2GAHP4spysRoaKOPY2zrVevty6Aah74T5mrW2CahvJPDHmPxm39pjkaB+saBedLpnw/TfDR61oprAjtuI8r/2X0AT7Yn60BBFDoBbb4lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EC1SwcRnB3qHtnUS6OrmTOLXoja38qTpuQD344gSjAk=;
 b=dIR2zvYFokA51Vu6JdWRNFpvT+8cYdsFP1aztlDIYOIeEPrAjuFzdao5hQYqYsi4+DlWQyONhTRs36GY4JXGz/U3texcYwPzhgGoTkH+tI08a/t75drHEhuAE3M8R7LgTOMzspuEwam+z5PtZLHpOzMK51mbMqKkfzJfFCfKZ5+eh5Lvkbfn4T9MZwrRsJhh+CTyAPpx6rY+Fz51hXRaE+DDEObAJkXaQkZpzKK4S2Rt5KULooi9pMFguUgITjyct3g18Vs3IsG+23Jhd7LZa9gZ0xaGinNdwOZhZElkfpAPyZ+gIGXl2n8gweQgg8DFfVMGRwwKn+skDiSBpHihFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from OS7PR01CA0045.jpnprd01.prod.outlook.com (2603:1096:604:257::20)
 by PUZPR06MB6171.apcprd06.prod.outlook.com (2603:1096:301:11e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.4; Tue, 24 Nov
 2026 06:17:22 +0000
Received: from OSA0EPF000000C9.apcprd02.prod.outlook.com
 (2603:1096:604:257:cafe::15) by OS7PR01CA0045.outlook.office365.com
 (2603:1096:604:257::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.14 via Frontend Transport; Tue,
 24 Nov 2026 06:17:22 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000C9.mail.protection.outlook.com (10.167.240.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 06:17:22 +0000
Received: from cix (unknown [172.16.64.42])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 30991427EFD7;
	Tue, 24 Nov 2026 14:17:21 +0800 (CST)
Date: Tue, 24 Nov 2026 14:17:20 +0800
From: Cunyuan Liu <cunyuan.liu@cixtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: boris.brezillon@collabora.com, steven.price@arm.com,
	liviu.dudau@arm.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, gary.yang@cixtech.com, fugang.duan@cixtech.com,
	daniel.almeida@collabora.com, aliceryhl@google.com,
	p.zabel@pengutronix.de, daniel@fooishbar.org,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, cix-kernel-upstream@cixtech.com,
	robin.wang@cixtech.com
Subject: Re: [PATCH v3 3/7] dt-bindings: gpu: arm,mali-valhall-csf: Add
 system-cache policies
Message-ID: <awUr8JIE8GTgxwL4@cix>
References: <20261119123850.2994625-1-cunyuan.liu@cixtech.com>
 <20261119123850.2994625-4-cunyuan.liu@cixtech.com>
 <20261122-greedy-cuddly-hog-06c4ac@quoll>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261122-greedy-cuddly-hog-06c4ac@quoll>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000C9:EE_|PUZPR06MB6171:EE_
X-MS-Office365-Filtering-Correlation-Id: b3589386-f308-4dd4-a37c-08df49f299e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|82310400026|23010399003|36860700016|261009223027099003|6133799003|18002099003|22082099003|3023799007|261028144727099003|261022105027099003|261102123227099003|261026140227099003|261021121427099003|10067099003|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	Y+leva9Kz6CeEVTixEYppxAgAl6EAsvL/h3l8UlbmR/H+yKOktYkKCdbOK8TDoonWz9VMzhJCP+azL94x2MK5X52UAFg+bCTQ4ioRazhtbwqRQSF/zKzpxhXImEv8kgP3n6MDqgj0B/I6oGTxHY9bQYbsuni34l1ytBiOHpHGiLhmbWiM0LV/yexOw49AEoKpNwWGY/o76nkfU7O9MY+JB48ssdU+hYcR4cstIR6q+saNBWlgdvhYPt1vuV2T2zY/wqecpM1Icjk+U5dHNZxq9Xcl1hubJRmrGN2HvCsS1LQW1brs6LIjiV7HUz4XKc838MbB+CJcAotfqqoGVfgDq92QjY0wukZgRcdAqHjW5xlIYt5Zw7D31/h34YVgwQV6wLEaWHmZkKylMbIkmq7HvAtgTnEHAPE5I5GRMCtYfFUTS3yD39Pmkf23zMMzux6yrevlwS9Le0ctLz7PwDn85MbAdlxO6mDeX+fYeM9OFkm0RYiF4ja8hxNE18IuBcQt5mzOPOoHW++yyb2MIZ+ODN1jjIcOIfnsqqkzPXcVFHJf6T+OiFZOAk5N0xbygat1tUQLMzBMtWpCIKAD+xpYN1Bskx09aV5T6/3hD44FCumXsG0w6ZoVKfft2VPhuRvUnTWlpctMQ8ypyWdKbcwp1id+oGbLQY4aNsy2OiTRSNIc4G9g4Bchb+CD6OOnvMxyR40HYH7h4axMRFm+QZymg==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(82310400026)(23010399003)(36860700016)(261009223027099003)(6133799003)(18002099003)(22082099003)(3023799007)(261028144727099003)(261022105027099003)(261102123227099003)(261026140227099003)(261021121427099003)(10067099003)(56012099006)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	IL0Gfrf+Jsz2oDqhODFYXdUSRsoTBXMvreGJrUUVuKju4Zmrz7lwQqtgEE3ERM1upQmhLGn+lYmtc04i7I86TsMr8WgpHM8E4/FHXlqL691MuqQ0m1d3m/zI933LTm/npPv/k0JgGU5ZnRsYZ7FJ8wGwDJRNEOTKNC97V4m/wu9xIzMw0oU9QhJxlpuqJcMiK1Poc1Li9MzbSKcTnq4feN7hNyDs1/1ri1LdqgMx6VpkFumtCfdy+9MxlcjXbUxMUespsnPP42xFEWoh+RogLJU6i5lykG3LOUTC8Dy6zDgTfKdOReyqX3tM1chjAbubr5H53D9WfOjk5TX+hEQyOX19ndYoRP9fYaickeHh/r0rXZbkG60itbtujgy3OK9tZJPgj81NQq4KikfrNdW6gqd2fb8x0OHNlsW47ZCIRzWvpcoQNXlJ/PcxB+lw7A7o
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 06:17:22.0515
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b3589386-f308-4dd4-a37c-08df49f299e2
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000C9.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB6171

Hi Krzysztof,

On 2026-11-22 17:58:56 +0100, Krzysztof Kozlowski wrote:
> On Thu, Nov 19, 2026 at 08:38:46PM +0800, Cunyuan Liu wrote:
> > Describe system-cache allocation policies for Mali GPUs with SYSC_ALLOC
> > registers. The policy depends on how the GPU is integrated with the rest
> > of the system and belongs in DT rather than a platform table in the driver.
> 
> Explain why.
> 
> 
> > [...]
> > +  arm,sysc-alloc:
> > +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
> > +    minItems: 1
> > +    maxItems: 32
> > +    items:
> > +      items:
> > +        - description: GPU internal source ID
> > +          minimum: 0
> > +          maximum: 31
> > +        - description: Read allocation policy
> > +          enum: [0, 2, 3, 4, 5]
> > +        - description: Write allocation policy
> > +          enum: [0, 2, 3, 4, 5]
> > +    description:
> > +      System-cache allocation policies for GPU architecture 11.0.3 and later.
> > +      Each entry contains a source ID, a read policy and a write policy.
> > +      Source IDs must be unique. Reserved source IDs and access directions
> > +      not supported by the GPU must use zero policies. Policy values are
> > +      0 for L2 allocation, 2 for never allocate, 3 for always allocate,
> > +      4 for partial allocation and 5 for L2 partial allocation. When present,
> > +      all source policies start at zero and the listed entries override them.
> > +      Omitted sources therefore use L2 allocation. If absent, the register
> > +      defaults are preserved.
> 
> Looks like integration specific, so implied by the compatible.
>

SYSC_ALLOC is a standard Mali GPU feature (architecture 11.0.3 and
later), not a Sky1-specific register, so other SoCs integrating these
GPUs may also need different allocation policies depending on their
system cache integration.

On CIX Sky1, devices on the MMHUB bus (such as the display controller)
cannot access the system-level cache. Buffers shared between the GPU and
MMHUB devices therefore require specific SYSC_ALLOC policies, otherwise
the GPU display output is corrupted.

In v2, these policies were in the driver via panthor_soc_data, similar
to the MediaTek mt8196 asn_hash table. I moved them to DT in v3 and
split them into this patch following Liviu's and Daniel's review on v2
so we could discuss the representation here.

Krzysztof, Liviu, Daniel: should I drop arm,sysc-alloc from DT and
derive the policies from "cix,sky1-mali" in the driver, or keep a
DT property?


Best regards,
Cunyuan
