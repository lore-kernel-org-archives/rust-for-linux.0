Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794438713;
	b=JWmefjf+JCGTsYL/zifoOOeWc9RUwK/l9cbUuA0M8sGRY59de576cVGWbmlHHsaiLYKS
	 vtZCuVKNdZvum3TiRVfT9T3/7PUgAxBYMVjH3CBLTqqKXDwKNwFTetKiKy2vxv8UaowdU
	 8t+5vT2H6p/TPqgZ7q0dDSmAewpRNyzVRX2GF5IfmfXSBy2Y9StKVfLBvdyVjQfUpYNEy
	 f3jV8mWV3khYO26+04tR9/7z9qrMeTFzuhn1EQEg7NyfWyiPD1BMJfbEfaNJ0ZUd2JVKn
	 13hcd0gkwk4rAp5YAGmFc5MTKqKlIuaESf7XiWLzhp6AGNWXNXDATaAfrH3ZVLvn/Zw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794438713;
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
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=j9vsSf1KR1yvjgoj1lKORvu+cfW5WUPAo7fpPbR0G5w=;
	b=m0rQhzKAv6SIOHhD1ctbiFrN3yJmbV3+JYR4WG8IfGfzBifjhnmhIeAQVzK2TYGcPbDN
	 oNxswNaujDcm3oPG1gUCgD2wN/ORXYPp3LI9paCy2IvOyRt83gQEr49KPNJkuNSUm1TO4
	 HZzSoTYfQ7J/fA5PdNmYrOwyFSJzwj7sihlBf+1eQqx2+Koh4A/nzSv5hI9wcETuSo8QU
	 xuW4sRTlNpUjp/4h+B6sCL7mcBpBZwJl6fomle8r7yYzTIn+08NNNAlv8wtWzeiLkstQI
	 PVfXspvSBcsU3YIhf1DIBzEmWoRAjzRu4Ac+ec1KVz2v149h9BYBvBX4xt1nSQfJgKQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=epRX5QAN;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=rL8pmSEd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B7E606A31C;
	Wed, 11 Nov 2026 23:11:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80B7E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=epRX5QAN;
	dkim=pass (1024-bit key, unprotected) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=rL8pmSEd
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6ABMbpjb2648340;
	Wed, 11 Nov 2026 17:11:14 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=j9vsSf1KR1yvjgoj1lKORvu+cfW5WUPAo7fpPbR0G
	5w=; b=epRX5QANw7XYCxMEOP8txVYVJ4/PbjqkZlxwOYSM7cKea8Z8R8QZv4L9S
	4ROMneQ3KgT27Trhz8Iz11NtF7xLKajKb61vXwYvQyprVrAQciDwmkKN0sIqPTrQ
	74boNwdYoV0QTg0oWOY6f6KFPKRrfXWwev0Ya9iTeSuBzjeiQcaExkNc2Cerwf66
	twPe2RM8JWY6BcEYz7SU5kc6ddL4wulXrPehBhp/+fPCBzrCrcOPPUAI/A3EYu40
	lEOM/6ezLPztuVaLVM7KF/qF+OX7dc/H/7IxbTGW26aVnwz6i2GHYoSmVY+xqjjg
	45nzeuiU7BVpYaAb2hFkVXmd4Ty5A==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012062.outbound.protection.outlook.com [40.107.209.62])
	by m0384305.ppops.net (PPS) with ESMTPS id 4hveygxexg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Nov 2026 17:11:14 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WFZly/VwFA/14pjJabdUSh3KNWsMZNAAdxIltFJ3cbHtTiMd32LK9xdU17E+2wRTN8En0fUaRoUS99F/jMearZktOjqMecQAQNJ9uWYzEcqN6rbW65nHZ5cJ7cAgeKa1Yg9zFFGPHjwQNAcZb50QjiWuzRDf95RH+whPclHfeHTMG1+I/zDYkqcwMv39C4dbIXOR8F5XtMwl52dz/O7VZhcIbjG+2P9BGbP93zC+y3fc51cWp4tTL9SO6ZfkfZV4PklEis/o8lYLnaW47g3wGAYH/v1ZqSUY6+9iv1NTsaRb98+tB3v3910zXww2ARBnfawX7wRZ3zeLavaNBzoV3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j9vsSf1KR1yvjgoj1lKORvu+cfW5WUPAo7fpPbR0G5w=;
 b=ayM6e/OP6oibGFJw2UXkcXdf+X7kobYERBnKmN3DaGlEDDqvqsXRh38me7T89qsCs1oO6DP8JAaDh0O19Q2YpMXjsIEfJd0DWFzCgrnHSxa/0PSubdNFcnYcP1OROsBsGV5nJDnsfxalnnjvEyFrw8MZGXlhhANFvTMf7NEDD72OoGkU0Nsw7OtTZY4JRwGghXulKF0KlOHXTGMgZ7hhffWSIGSoF3F1PrcpYgWQId97MouZCmPWvBPoU1Kp2ZcjSIFjWAInOzCTzq2P/kUo8EhuH1WuDwn3j1LTR0Qkk2Z/E4RlUr1IZLedMdUwW1BtVf4GEDWPfGCGFKsGdkhNiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j9vsSf1KR1yvjgoj1lKORvu+cfW5WUPAo7fpPbR0G5w=;
 b=rL8pmSEdo2huZnS1k3ZhwK+u6HLCeWqz8VtrIGEfQCSNzaMDla6EyF3oBZEe34pu6oSMboo6Rf/bsevLE9Vq1QfVy8hd11Zvobd/3kBskhZOOMIJkUhPhoxWGR/MAbSK87e8wtaoEj5sNYoG2VIa8jG+f1K/BEdxdQY8HYSpJtY=
Received: from MW4P220CA0001.NAMP220.PROD.OUTLOOK.COM (2603:10b6:303:115::6)
 by PH0PR10MB4678.namprd10.prod.outlook.com (2603:10b6:510:3b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Wed, 11 Nov
 2026 23:11:12 +0000
Received: from SJ5PEPF000001F6.namprd05.prod.outlook.com
 (2603:10b6:303:115:cafe::1a) by MW4P220CA0001.outlook.office365.com
 (2603:10b6:303:115::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Wed, 11
 Nov 2026 23:11:11 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ5PEPF000001F6.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 11 Nov 2026 23:11:11 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 11 Nov
 2026 17:10:54 -0600
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 11 Nov
 2026 17:10:54 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 11 Nov 2026 17:10:54 -0600
Received: from ula0226330.lan ([10.249.32.167])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6ABNAru6641796;
	Wed, 11 Nov 2026 17:10:53 -0600
From: Andrew Davis <afd@ti.com>
To: Igor Korotin <igor.korotin@linux.dev>, Danilo Krummrich <dakr@kernel.org>,
        Daniel Almeida <daniel.almeida@collabora.com>,
        Miguel Ojeda
	<ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
        Gary Guo
	<gary@garyguo.net>,
        =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=
	<bjorn3_gh@protonmail.com>,
        Benno Lossin <lossin@kernel.org>,
        "Andreas
 Hindborg" <a.hindborg@kernel.org>,
        Alice Ryhl <aliceryhl@google.com>, "Trevor
 Gross" <tmgross@umich.edu>,
        Tamir Duberstein <tamird@kernel.org>,
        "Alexandre
 Courbot" <acourbot@nvidia.com>,
        =?UTF-8?q?Onur=20=C3=96zkan?=
	<work@onurozkan.dev>
CC: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Andrew
 Davis" <afd@ti.com>
Subject: [RFC PATCH v2] rust: i2c: Remove use of bindings::i2c_match_id
Date: Wed, 11 Nov 2026 17:10:53 -0600
Message-ID: <20261111231053.529616-1-afd@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F6:EE_|PH0PR10MB4678:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cbb2057-46ae-4bb0-4f58-08df404913bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|36860700016|82310400026|261021121427099003|56012099006|261021123027099003|261102123227099003|261026121527099003|261009223027099003|261022075727099003|921020|6133799003|18002099003|10067099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	dABLNZWO12gMWHk4jb/Mg7bk3AmnlrD/2eDq+qgfwZXqEaF8j7NOLuMKAPy/viholrrk15IdXfao0UJpzS2xLKF9LIHcxqnMg0fx/p0WXrPL1bLQ58r87cVF+GyG4ygyrPwvZKuzdx63BzjScYN1Cmp5u7wEBPhKYpOOmx7XG+8cuGKQpdDNF0oXHSM3K2E2rb/C3K714pqwZBte3WJt4OCrcl0rh1OYj3jJL4NSAmFX7Pgqgu+HixHS31XqPk2B7eEGlNK6V5pVLooe9LQbv66RuQVK5z0bcUsgq09ca8q04+4qyk/GVtH6SvIeVLnVp7AjSEXuyLs42pabkZM6/TPy/PEFozDLsRoAajeXT3uJSkQ9Tu9LKqnoAFlXaZFebIKEWAucQ4wp3T1nkfvzV2mzqV9jmHLmFbKYLgoEeUXYiaXpxShYw/8UKnCSPuehY+Bx1YaG5JQazgvqmiID8ihqL9IePyloqWz28aPoLj9exEEs6PHzqiZ4j0pvyVNm5G9/XdblKBHW61KOlds1aogtVi3PbL6OIcBhS/59ZoSwLZD6q4ks2mMkDb4WQ0IGLcp61kCFTrgVHp1drnNB/Yhu0m5+jCXCP9Q3jkLBLBA3P/iwqSDe6APjzSWITAXiLAxr03NRGHtSNImUmaF14vUhfHXO/tiGkYSA0qkml4U1/S3hQBoskaH9XLh7dBTozTbnFnIK98PXxEYLBoiFx93BzEMRpAKXpleCY/PJ9RE0OF1Zffx80wbI5abGNNua
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(36860700016)(82310400026)(261021121427099003)(56012099006)(261021123027099003)(261102123227099003)(261026121527099003)(261009223027099003)(261022075727099003)(921020)(6133799003)(18002099003)(10067099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hT+oD8EG6YDnk4aAedYS9iubbY77R1Iy2PBLCHBrstJvMgCNEHVIPndlaus5jJFGY94wM5GdqPHduausaB+42qQMJwvv2rhFXbZOR0CE4REiSfVguIWePtHHBbSwakUXeUZT1GNNbenrHVuKUQhuYgDs/C2/+Qeff7z8tEarUFMmc7o5+tM4RIcSz9cA0MD5OvGslcDysybxLorbFHw0jiYRSFzCW3Vwuss6doZaRaRhvhLsQ7i/7Cgm1N/2P2NoGMODJvNJC3oV7swJHWUNs+mVarb+2l9uy5BiXlBxhErqt3VnhTjjof7m+dKPUPz2EhJTsgTqe6AC/S1lVOd2XD/4BMVXYCYt5g3DfDWzUBS4tIPh75zQltz5QeSLWsMywVmGuJxed02LWYE0g0ZUQDNTtA1in8PAp0keFOLIwGHNdWwELr2PSrO0ujM1W5RY
X-Exchange-RoutingPolicyChecked:
	EO8KVkl32Nq2wa6ChdCI3HYBCYwwvQu6aFrxNobC+PwyjecLgcopoBP4Uo0PP6ftddAudQePVby27LtaG0jiPwPQJQybPWCVQ+rYiJaphX8nnq0Q9FAaVQ3L616GADMWklRqbJpEnnnrAt0m74ByttxVMLr4Oi67uxTh/5EWZat04dNkWCXEnVnmplEi4lr1sm/dxlcOZEXGPavgBQ7IDRL57jBzve752mq+T8nMbQjGrctNHSRDK3VDmOCEXcljF9ES56hkj6luB2PD8NhxbNU9fN5ZtkiEFJVdP5YcHVC2n7EZTUfugn5f/ct/oMaQLr9fKRjoDw/HtQxQQIvz/g==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 23:11:11.6463
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cbb2057-46ae-4bb0-4f58-08df404913bc
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4678
X-Proofpoint-GUID: ywL4O1moL4QTy1NXxcMGfmyxmr2HtzGQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA5MiBTYWx0ZWRfXxeGWGbtcsqWP
 5kRr2f40/+afcf75znG83EF9zRXrTegxhvi0/HTHNVsKBgegHC+VYrusRZG0iqmtlb/HW+KtGO2
 7jhMj5GhO7eKRnlgi8mELfogdPWfU1o=
X-Proofpoint-ORIG-GUID: ywL4O1moL4QTy1NXxcMGfmyxmr2HtzGQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA5MiBTYWx0ZWRfX9vAloLMgnHpN
 r8QkwuFgSuNVh/8Mxm7yPCW9rK17WIhUWvsFGGcoyNtnsfLQ7Zc8X5CMHhAFRUhPh0C0bnmCNGK
 /7CxmsPMYGrp/sBJiWhfZts3AL5yKs821M+4P5oUJmr4KKvIWrqBJsnPVB5J39mVNgRWveHi00n
 6gQHeUr5Ri5xsPs7lHpxLpTWc59jaloETeSDICTYkeMmehpdaiRD2ar2iYhjx8763KWQXNuTNfM
 lsHJURT4YZcH7MwKh+/X+RVIgGfs7vHAYZDGG5V3JEKpwtT+SYngfYcKWrWvcHZmo7lfIqmXlLF
 vlYxfhNDVb31+44DOlEv6t9G2oWMXmvb88cz43saJ630b6xDKTfg5AnIY1WdrmlE0f3e6M9l1pE
 cJxl0PcMB6ZQzDUZ/YV63IzHVfzEfT9pQD7dnaxuOKGy1KTUK8MJtEwoZ8Mdp6AkoaszyQaIoY5
 kWcrhANOFmLWrJSRJpQ==
X-Authority-Analysis: v=2.4 cv=FpaQbGrq c=1 sm=1 tr=0 ts=6af4f612 cx=c_pps
 a=6wJ5VEhJUsGCSgd7q/o3PA==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=JX5HHOsB-ljCSBZzwqgA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_06,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110092

The C function i2c_match_id() is slated for removal, remove use of this
from Rust I2C by switching to bindings::i2c_get_match_data().

Signed-off-by: Andrew Davis <afd@ti.com>
---

Well Sashiko suggested I take the easy way and just re-use a different C
function instead of trying to open-code the loop in Rust. The C function
implements the same lookup as i2c_id_info did so we can drop that out and
its i2c_id_table helper. Still would like some help on checking if this
is actually correct though..

Thanks,
Andrew

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

