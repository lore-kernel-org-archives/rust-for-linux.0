Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795020336;
	b=31Kkvg6gwncwbVbpnZTDc/9nfumbNEUTypCckLR6GKGU5PuKFm7xnFdZbv3RNEwZpR2l
	 frc9t+Ec18Du/npPAocU4vXu5V+9mckaxgE6p8Ail78W728l6i91FU9AuBoqazAZE0JO7
	 YtSFOZim23DAK1+Oc9yUFxLUsOfXKf/8qq6ktyEgTmJP94WkeRxvjQQljkkgn8VmZXL8B
	 VLsbsKl6vYl9EwHDHvoNCIGS2yc+dga5Z0DTJxMijlBkzZLq8Et2zTx1orT/1QpMgPLHO
	 WMtOT93aqAqP4YlDqsDFU1dtnZnjP6alefcb+SAgFOuVIF86jnY1DK2s2WVujw6477Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795020336;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Received:Received:From:To:CC:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=MrX5mC4VPlUVN+JUyclxkItxC7EtCEZKrKl0Ge+qRwg=;
	b=dzdAwlMMFIi6LKhLxLrTivqZHjXkaAOBSYG+YDTJWFCKu1f2copqdFLTf1/vg885ZLDR
	 WpcrPxS07wKW7wyPGbYvA3VFtEuvpaTShm5dyp2KjNV8lCtIsUl06waG0rJCLVMUw/loJ
	 tbczqaugB9pNfOe7sEQFW4/ZvSyjb/uEfcgT3YtKJPJorILanTuun9lQ/HekGZXkH29ly
	 2U/pdw3MHmN39mEcVNjHSouuCFTwzGKIa8XqrPSKC/L3hqz6jhzxZ0Ff280WOGZ2UDzqL
	 GNJKuucy0kysZp8+LD11aVbv5Xl0PwJkvzwWKZ21yPpOtPpEVzBBtEwaSZKZP8wMFeg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=BT1iEfES;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=AWMo1Lqm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C6B606A320;
	Wed, 18 Nov 2026 16:45:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82C6B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=BT1iEfES;
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=AWMo1Lqm
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6AIDPr7h3440141;
	Wed, 18 Nov 2026 10:45:01 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=MrX5mC4VPlUVN+JUyclxkItxC7EtCEZKrKl0Ge+qR
	wg=; b=BT1iEfESJSY70O9Xl25EynN8v4XMCGVthJEQIfiu94bA43htMfYDfvx4P
	7rQixkBhSTMasy/bZBlXCyLitYyHuIatF/KCf9/L4VUX8B5Ob6smamqrjE9d5e1W
	prUoq1r7ZDkZKdsa6i7E57x8pRcfASqImecvcDWpaGnnuEEnIuW8sPMhQsm7jK6m
	vqWB3qCVitALm6HqokTa1FsBIlNNPq6eVSqBlANVaffW42Bmn/VEHGgl583l9j5Y
	uSl/8TX5/btKS522qnZyEISvuYMCun0mz2EnRwVARuzNFurq1PDJmpfwb8Gw0Cut
	drLh48E3v2MvJlJJ7QbtnkGal4bXA==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012020.outbound.protection.outlook.com [52.101.53.20])
	by m0384305.ppops.net (PPS) with ESMTPS id 4j19fp2bak-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 18 Nov 2026 10:45:00 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vyioxvXn2hSGK7JcgCtBy+i7m+ITO6HRZq8wbf6R/ERE/3xsfER0YZw4Zi416Vrx/fvJzi2UMdLd8Mw8CEA9IrInVSAIJnW/3JSGWW1s6qi9QNjqdlcKGHrt8B5nyHrpMhGiuVMbJbbUaMuRglJ1quewgAtLtDqVmDppD2j1JFP3OloFJ1iMXWKrsXjdWTguypj6hA2HZ73xemd7rHQ9555t79dD6LvYdMo6CEEirz9Xsn5f+CLabJjQFHfbrWOIpEzct9n5+ExJZ43K73sNYLqO/idVZt4qmmsqgFXfv64gt553bsGhlp/VLANcK63muVNwpCHcHP/M6okTWi3RvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MrX5mC4VPlUVN+JUyclxkItxC7EtCEZKrKl0Ge+qRwg=;
 b=CPnUvZmbUZwqrDmlOnbWxFBF8yKdlaJGMf7TOUk1CwCiNA+3QlsLdR8TJBFO8dsMZaM0hh30p3WqJs40Y7eAhbsQGO0gH1HSefJZfPlmbtptbDYj4dhVwdEiAHi+RWH++Io8fbpm3Gsa2vqRBMv84jVKpRho/TAxef+I7PDeC+NwFnYxEFmLCHxD52oJC4if/xvnfF64ovr70nkGi3ueE/9t9StLFeVWkqucg4XYU0A4m3dbYVMJ4JzHefHZX/EzfIAM6Mu1Uxc+FDTUieygbDSf74jX/uUwVUyzKOISrA6w5Q9sasrJWIrcb8o81xz/Cz8BN1IEbw1VYMGzi1HYLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MrX5mC4VPlUVN+JUyclxkItxC7EtCEZKrKl0Ge+qRwg=;
 b=AWMo1Lqmc0qPxLiyj3UbwWr3nbiqbQ7wZqSUO9qtGJec4Gb1iGsLmlKZ4zol2X04o1kMW7QLfQDQcVM47RfG5qkFP/w2DRgdBRjLYZ3ukiUU1N3XgbEdJ7fdP9Hvgxp+pkf86J7ualyGPfMFWltJi9Uz8RyOajvGlAMUEsOqnZg=
Received: from BL1P222CA0015.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:2c7::20)
 by CH3PR10MB7957.namprd10.prod.outlook.com (2603:10b6:610:1bf::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 16:44:55 +0000
Received: from IA0PEPF0000003C.namprd03.prod.outlook.com
 (2603:10b6:208:2c7:cafe::37) by BL1P222CA0015.outlook.office365.com
 (2603:10b6:208:2c7::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.13 via Frontend Transport; Wed,
 18 Nov 2026 16:44:53 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 IA0PEPF0000003C.mail.protection.outlook.com (10.167.249.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 16:44:51 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 18 Nov
 2026 10:44:05 -0600
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 18 Nov
 2026 10:44:05 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 18 Nov 2026 10:44:05 -0600
Received: from ula0226330.lan ([10.249.36.95])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6AIGi4Gk1372119;
	Wed, 18 Nov 2026 10:44:04 -0600
From: Andrew Davis <afd@ti.com>
To: Igor Korotin <igor.korotin@linux.dev>, Danilo Krummrich <dakr@kernel.org>,
        Daniel Almeida <daniel.almeida@collabora.com>,
        Miguel Ojeda
	<ojeda@kernel.org>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        "Boqun
 Feng" <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
        =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
        Benno Lossin
	<lossin@kernel.org>,
        Andreas Hindborg <a.hindborg@kernel.org>,
        Alice Ryhl
	<aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
        Tamir Duberstein
	<tamird@kernel.org>,
        Alexandre Courbot <acourbot@nvidia.com>,
        =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
CC: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Andrew
 Davis" <afd@ti.com>
Subject: [PATCH] rust: i2c: Remove use of bindings::i2c_match_id
Date: Wed, 18 Nov 2026 10:44:04 -0600
Message-ID: <20261118164404.237865-1-afd@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111205204.481923-1-afd@ti.com>
References: <20261111205204.481923-1-afd@ti.com>
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
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PEPF0000003C:EE_|CH3PR10MB7957:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f5b7b29-d106-4ed2-15c7-08df45934446
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|82310400026|1800799024|36860700016|376014|261102123227099003|261026121527099003|261022075727099003|261021121427099003|261021123027099003|921020|56012099006|10067099003|18002099003|22082099003|261009223027099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	wHvzV6Hk0DwVPy1BJE78sz8VY/MXU4q8RmvTnwMQXKtOGBOObzVfqyztqa4xKpr9cuYzwHdjHmljU7SKe4tISkGVlHotmlIQDDDJf2DOkbU7jDpDFCGwIvlUtiZTNbHk9i2GB00no5xF4hrXDdeauzA5FKwQoGxKcgblnKEMhbZ9yz6aCeE0vNXj8IHohyDAgZ0qwjle21O1qqsuUJWvJO9o51qj71dYAUgj2I0INsIwJiVBcWfjtxzLjuYzitx/YLCEeJuKI/XJR9Xgf05SgszIFOwIndprIyP4atFOG3WN+nJiM77OjrlJ4y3oBKmL+R+F2/fPKHWkiV/ufMeBi++d2P7pEQ0FBcwOZn/kfEAX8LH9O/2mibiKb79wHYulHEf0H3P7hs8JJdhWz9sVsE1jZbQPjERmYBYamTHYe4A233SUEDn6fOyQxalyPke6rQ+yIh7Prwgu/dVdVpZWTP2ThKRhv3cCgzOxhVKwXTsxlYo00m4qZ6AwVT5zoinreBUnub/sDZpN55XNmxK4kA7zarDxQwHVsyYEC0yE0+5ZVyHARCkPx6x4cfnV6VsQUhEMdbf/a/jwH2NJGzcKGurnVuumr2rq4AyDukm59KdQWNCPimFXChwPvpkPHEn3uYEld+jHSzvCZtE8bHMsc6Bt4miK7wi98ONYIy6sF25WPkWpQclrgXdMXk7hdSHyuohiPLRXFEX/6y0oG07Gz99GDtKzu4/8Arurt5qQlweP8esQpCnxOT69TcJXv2XM
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(82310400026)(1800799024)(36860700016)(376014)(261102123227099003)(261026121527099003)(261022075727099003)(261021121427099003)(261021123027099003)(921020)(56012099006)(10067099003)(18002099003)(22082099003)(261009223027099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	aEO1y3B+QkKbsczFrwV/G1nSKxmMgfQgPemuZmOGyzLk3NLtCKru9vOBt8AGaDZV8VsVXmaK15GdxedHLpcgaEULajUi2bY+nyUjkLwVpG0Y2zkIuSFnJWTpFdulaC30cnRUDyCoxWwj11AcpCp5T6vcE3vOSC2TTTfod/RIpdva7uiN2enZYoSfLqvMfN+w0yJpuJ2RRhJyWu2hbjt0f2zmpfQAbDL1fLy4YXmo4JZBMRpeXhLht6wkLa2SbNN2unQqpJFl7pgOfjp0zW8ClRqN8izTFh6dGfAesEo0hCsuvNisTFByh+XU0lYUXn5A2a0cn0lVJXcQ2ZQs/egQU+msU0qsaq5IyCrKZXYIFJ3St1vwB+djJQYxK1C7u9d80AKO2Z0hDcI9BjnRvztWXDWJ+hBwqQlgXn1sbv+0QguUG+1/Ast5uUFAWyruEeDV
X-Exchange-RoutingPolicyChecked:
	xpAWeHOm7UqYDDxU7kv0G1egUdZc50dvTjUg9Hw4wEt4V320VHLM4LuKzHqxjj3gk2jBKRYgp/+Ml/t4S7T8Sv+ak3GNGlma3rCvukh0LzEhG6H2JDzZR0wyxuDVCOpBD0zalMdZsgrsNalXW4wggFn6VgGKtHAnRKd8z3o2AOOVjIU3VROO1ykamG8kg7Hctd/U87WpVh5tNmA5DGIv9ukTtw1QgD2PIIlKneNwrdycUL79WRJvfF5t7hiT696ZoZ1IucZCW6IOg46zRk9PyHUQDiEsAZcx2M8Urv/9it29bTm/xlAcPMnaBmhShDJUIw2ai0m4Ec8IrOHzxvNEJg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 16:44:51.6656
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f5b7b29-d106-4ed2-15c7-08df45934446
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	IA0PEPF0000003C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7957
X-Proofpoint-GUID: 8EcU8Aegs0O-Mqsk2w1bj2j-cLXauBIe
X-Authority-Analysis: v=2.4 cv=ebKo7LEH c=1 sm=1 tr=0 ts=6afdd60c cx=c_pps
 a=3tfckwpITFtzIurveUQz+Q==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=sozttTNsAAAA:8 a=_2yia0w1AAAA:8 a=zBEN6GVtQS-nI4kvh8cA:9
 a=4yAS8WwzZ1jAEY03B-5r:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA2NiBTYWx0ZWRfX5f7UV7JLOxqK
 4zQ7sZJDCzdx1VtjjgtQ9FCsY/UQmEZPeCBYT4kjkIDs4doNsK1Qt8LfmBGISbHBCG8aEoJdDDj
 jf5yKM4pIzJ5XwPFairIrcegLncDd7c=
X-Proofpoint-ORIG-GUID: 8EcU8Aegs0O-Mqsk2w1bj2j-cLXauBIe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA2NiBTYWx0ZWRfXzQkD27M1UQMG
 UwTaCV2N2DGarvcMedyel+llQNbKP0zDpt+Z1osyCLg/0rgpnWgU3sHwCX2+BSTlmcxNZluhyPL
 9z7k7vp+Wfm7iorTumyD3ig+9t0pwprrskHls75rTwW/dCZysXFh1Dh5ztuV21mYCIfOgFg1DGg
 jw9t+W73E/1Hq5Nc5WIYsxYEjU1UYhyE4K6v1BhBfbrE5lqeP7EyyffRZhyI0ppLzcXTT1U2EsY
 d4xUJKmllj/tfMgBrCnvyl32/vKsSSOwj5uWkr7tHeZ+KwrDqB/WUc2Cew3ALEVz0uox03v1PyG
 EVWouG5D7kHK9RYmCuAgw3N9A49wVA+1hjViDJCRFpP/5+/KrhE8NXO8zL32uq+UmdGkGRUHpGT
 nZ9/0MrXKNDo5F1YnZbufcHdk+As4xF6t6BsgNG+VLYQclQcfn0VpzywnKvFSNnuy1K8/GEf4/X
 gFt4LThhOvS52Sip1KA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180066

The C function i2c_match_id() is slated for removal, remove use of this
from Rust I2C by switching to bindings::i2c_get_match_data().

Signed-off-by: Andrew Davis <afd@ti.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
---
 rust/kernel/i2c.rs | 39 +++++++--------------------------------
 1 file changed, 7 insertions(+), 32 deletions(-)

diff --git a/rust/kernel/i2c.rs b/rust/kernel/i2c.rs
index b4ff25c830fc0..37d914fcb3662 100644
--- a/rust/kernel/i2c.rs
+++ b/rust/kernel/i2c.rs
@@ -148,10 +148,13 @@ extern "C" fn probe_callback(idev: *mut bindings::i2c_client) -> kernel::ffi::c_
         // INVARIANT: `idev` is valid for the duration of `probe_callback()`.
         let idev = unsafe { &*idev.cast::<I2cClient<device::CoreInternal<'_>>>() };
 
-        let info = Self::i2c_id_info(idev).or_else(|| {
-            // SAFETY: `idev` matched data is of type `Self::IdInfo`.
-            unsafe { <Self as driver::Adapter>::id_info(idev.as_ref()) }
-        });
+        // SAFETY: `idev` is a valid `struct i2c_client` bound to this driver, so
+        // `i2c_get_match_data()` may read `idev.dev.driver`.
+        let raw_info = unsafe { bindings::i2c_get_match_data(idev.as_raw()) };
+
+        // SAFETY: Non-NULL match data is either the OF/ACPI entry data or the `driver_data` of an
+        // I2C id entry. Both are built from `&'static Self::IdInfo` by this driver's tables.
+        let info = unsafe { raw_info.cast::<T::IdInfo>().as_ref() };
 
         from_result(|| {
             let data = T::probe(idev, info);
@@ -184,34 +187,6 @@ extern "C" fn shutdown_callback(idev: *mut bindings::i2c_client) {
 
         T::shutdown(idev, data);
     }
-
-    /// The [`i2c::IdTable`] of the corresponding driver.
-    fn i2c_id_table() -> Option<IdTable<<Self as driver::Adapter>::IdInfo>> {
-        T::I2C_ID_TABLE
-    }
-
-    /// Returns the driver's private data from the matching entry in the [`i2c::IdTable`], if any.
-    ///
-    /// If this returns `None`, it means there is no match with an entry in the [`i2c::IdTable`].
-    fn i2c_id_info(dev: &I2cClient) -> Option<&'static <Self as driver::Adapter>::IdInfo> {
-        let table = Self::i2c_id_table()?;
-
-        // SAFETY:
-        // - `table` has static lifetime, hence it's valid for reads
-        // - `dev` is guaranteed to be valid while it's alive, and so is `dev.as_raw()`.
-        let raw_id = unsafe { bindings::i2c_match_id(table.as_ptr(), dev.as_raw()) };
-
-        if raw_id.is_null() {
-            return None;
-        }
-
-        // SAFETY: `DeviceId` is a `#[repr(transparent)` wrapper of `struct i2c_device_id` and
-        // does not add additional invariants, so it's safe to transmute.
-        let id = unsafe { &*raw_id.cast::<DeviceId>() };
-
-        // SAFETY: `id` comes from `table` which is of type `IdArray<_, Self::IdInfo>`.
-        Some(unsafe { id.info_unchecked::<T::IdInfo>() })
-    }
 }
 
 impl<T: Driver> driver::Adapter for Adapter<T> {
-- 
2.43.0

