Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794430410;
	b=Zpf6ahz4p0YzDKUGNsM3Eq4d4nU9zSqyA/jCuzcP6R1v2i2I33pPYfit64NHQk6omzc9
	 VKORJca0pL0vqEvt1oBVl8krU5ojQKpJ1FSGHLsvPe3QAcOl2Dy1bY4moxjmtAeVIvXFZ
	 yMrVriwcI/TKIACTvGiU+X2slH679wxNEBrFwhDVamWtYQGJa2MuZ3oRO2II39xJlLnjk
	 K7ADW2R5r2xv6g/H9v4FFIlqAJZvTs7T6Co6iPhpFz1sJ0SC73LNMnX9TGW/HpsExpUT9
	 cDaon4sboypUVdGCFZQwHP8tmIgNwTwlPlkbLOF20Lkih7VXB1nRMiU7FwDQJuP83QA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794430410;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Received:Received:From:To:CC:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VK95iIzCycSvwhog2KQ98WLRKXX/mglPFbsbPoJrs7w=;
	b=Deb7uA9NgRKRXEEGBOcXMBq1QaO2VviUd/C7kx7yY5GRyuqucG7S8i3Ydrcq9H0rqLKJ
	 putqTeoJbeanogz3hBA7IpZC5HYHDWNjS85s53IOmpTPvvHnlzFGtNzh8A7WgJeK/tIy9
	 Z6YgxLigXMZXW7b4WOIRPRUd6ePueb5WvMGZGepS9KSuMQ+y2vYZw6i3Oc/j5G0PU85vj
	 k3CUKkhJxP1ydXTO/UGdoGg3OuYgNlRG6C6uskl8BDidltUC3+lV+Tgo2MtuKNabSTJPy
	 WF78h+fWDXOVuN+ldvfKlt24LszEEfJAH38KVhdZmhem1M/vFYnvtnkSEYagQs/5LnA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=YvEENdAB;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=IkhSeh0K;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C2D606A337;
	Wed, 11 Nov 2026 20:53:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6C2D606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=YvEENdAB;
	dkim=pass (1024-bit key, unprotected) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=IkhSeh0K
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABKRKr41603310;
	Wed, 11 Nov 2026 14:52:57 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=VK95iIzCycSvw
	hog2KQ98WLRKXX/mglPFbsbPoJrs7w=; b=YvEENdABXeWrG+u/JaXgXzpS716dx
	kyQz64jXhnNIl8FhpkUe4j+LOSq6ay6KehhMwfv5h3VJFIiNDkfV+cOt9kvNshpC
	X3bRT3WJoWRBL5qW2Iy8O6q8BwVuJ7/VGvoG/cP5yJTPOMJrWeJkLtXvmtNZfiLZ
	5PH2mPPEfB/pdtuFl74Teg8UHopYTbeXUWxWjMRmlgjZW+GARwwzTRAs4CrL8L6k
	pTqVDi4v47JTVPLtsyT9MP460jzWeZwJgT75LXOu6Iaj/ppq1gNk2PvI14TIwi6t
	x3lUCQ09UOrPBDb9vqQWgXcCbA8RKwC6aQc74finY0UzbsOWBJNoMpcqg==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011049.outbound.protection.outlook.com [40.107.208.49])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4hvvr6s2gv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Nov 2026 14:52:57 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gjtMCCoVhlhdkmx9DF6UPQSYtVZRTJ5/LELHHzAj8jFoqriyYjNvbmlRfb8dPxYNh5ojWN2dqMCzu1jl1I+/MW0wVlvLKVNZ23C7NYls+kw6xNV86LR0aqgaOguzQrctIuSJJYgDpSw1c0ofHJuYvW24jObQziwp3EdatvrNpTp/qsPVNfE3BuibJsYlTlmqBSn+4i1UjswWhMBE4d7oguYai+ahyMRW9GJ/biNXLJh3g194DNvxERp2FY7ofAxX89NcPqkPeZrEySsZE13fY+4pXNQGIIpgS8Ih5dNXADeIFLyLm7M08ltgg2Uca03RUgO5p2Vj3fxl8Q5i/BROcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VK95iIzCycSvwhog2KQ98WLRKXX/mglPFbsbPoJrs7w=;
 b=RgtVOgMbVPn7AOQS5nEZRNA/DAqIrTtqMFZZI4HWoxItSPLrqbzjH4y056soggMEUGNG4G7vMzXWaeytv5YTyQRKgmf5cWByfcnGYUz6kt5kSJ9SGChF02B8mU5MVGRgLV7y03gHpNB9P+Ep/7cgPvIFD0pUnUbPHtISA1zWH/DdepqtAF3BrRPSF6bhLtZQpspZzv9AjyFaom1vDGyiFe26Vl6D3h2biYRb+is0nmvrtiMgC8OJWfnUPbVr4tgFLwcAxoM58IhtWzdRkdAVBeiBDjOVzHGBVE955kcSU3nNrx49EAJf7O92nweBZzXgBT3potizhVkoIfVXtXBIXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VK95iIzCycSvwhog2KQ98WLRKXX/mglPFbsbPoJrs7w=;
 b=IkhSeh0KvsO06c+QLZPVR5Zj1f5VcKVmVjScBBwRXxTgXoHYFOFI42ieYiak6Nf7g/oLk/K5N9gu5mUrtEvmHfA+vdQBfw+ZNXmc67XRWiPNeQireCYp1e9tfcVt3PU6ILU/7niUD+scK13AycXiXss0R+4C6ZHAwb6rRPkk4xw=
Received: from CH5P221CA0004.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1f2::20)
 by IA4PR10MB912210.namprd10.prod.outlook.com (2603:10b6:207:128::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Wed, 11 Nov
 2026 20:52:54 +0000
Received: from CH2PEPF00000144.namprd02.prod.outlook.com
 (2603:10b6:610:1f2:cafe::9a) by CH5P221CA0004.outlook.office365.com
 (2603:10b6:610:1f2::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Wed, 11
 Nov 2026 20:52:54 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH2PEPF00000144.mail.protection.outlook.com (10.167.244.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 11 Nov 2026 20:52:54 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 11 Nov
 2026 14:52:05 -0600
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 11 Nov
 2026 14:52:05 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 11 Nov 2026 14:52:05 -0600
Received: from ula0226330.lan ([10.249.32.167])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6ABKq4BZ446030;
	Wed, 11 Nov 2026 14:52:04 -0600
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
Subject: [RFC PATCH] rust: i2c: Remove use of bindings::i2c_match_id
Date: Wed, 11 Nov 2026 14:52:04 -0600
Message-ID: <20261111205204.481923-1-afd@ti.com>
X-Mailer: git-send-email 2.43.0
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000144:EE_|IA4PR10MB912210:EE_
X-MS-Office365-Filtering-Correlation-Id: a9c83eb0-f854-45ad-d724-08df4035c1f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|7416014|36860700016|23010399003|6133799003|18002099003|261009223027099003|261022105027099003|261021121427099003|261021123027099003|921020|261102123227099003|261026121527099003|261028144727099003|261026140227099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	+7QfOE77Yr5SneqEdBPg1UQqO+y8av4vyl6tupfiWBOYb5wFwONVw7qJ6HitF0QSqGa5qR/MMfFIpesGONnXNbf7sH4tmXI2eWjDrHgMjgRiMuvP0sx4yEe9dJ7W0Z7+yHfvVsE0VhyggwxqIoF2yuwT73d6nN+MNztO7mn0PfLGT5Nx+4/YAhTxtMxcebEUaLbhA6lo/kd/ZUFJZVJUexv5fW8mCTvvQx9taYQNCByVk33sw80D/QIn8WdZ2oSfmRP4mFAVo4eKrKKudRYMO/SWY+25fpKAE8fam29RcqhGUYVdxLc8drrc6PUcb/bu/mFECCfbgPgXHM8V8xCvyRtRZsWhpyqw6dB6mEjd1HyKDGYtj3LnwIIpx6jyw9EU/lfkGxDW4jFXd6XUY2uFp6hHi1/oXKy9DiotFlyOGyi3IHMxh0aY7JaYm1CosHE/B7LX5QbWFPva0PMAuDArhohaS2e8XGfhOg7hY1vhcd/hyJ9v0g+sehu9zAYbEhRW+rfyfN9fTPUy541lkYNAEJUERsYIOCAPL4Wwib93Z+cERHoN8jD9rrjyDwREvyCPkSSqnRkXS9m9jrrfDRXngX84KOpcxt489IEIPKI5R/NiCLo2957Z+snoGi0DMvOw6c4ZFKf1c3y6cjd0t6jknanS+bYhN21T711EMrS6tiVwvwRsBUxsE5i/6aBG/J1bGZvssViNTMNm40mBqzcxGRNosb9+VBFLIC01W2hWdcMXKcofxAokYQm5FtNSyFMY
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(7416014)(36860700016)(23010399003)(6133799003)(18002099003)(261009223027099003)(261022105027099003)(261021121427099003)(261021123027099003)(921020)(261102123227099003)(261026121527099003)(261028144727099003)(261026140227099003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	HZf4YTSHWN7CfkEIx7vc8PZfzzopfVRVqVS25EsB+lQc05YNMIao1n4fe3wwfhREE6z/JLzieLWxiQYm3pjX7RASo59GIlnnBSJWYbhWj1oohKFBq5mcIppHoinRvIAEI8J/A8XWzf4/cwAlBbTr2BlKuHHEA2X/hmz4JvSGQgrXtECzOReDaBilt4ujgQEVPS2UhJ/d/3YXWHEq6KaE15574tQ2A6EYrrAvwta/EPk6cI1d9Z13/QQvLzhReYzI42i5hnavOsqjUznUigsyvstnAnvdJ+NcL59xnSxJBm+HgpcSGbjSIbFcdQ+lqC8+aotwx0U+c9mYzPji0jItFEBugde3JNt6+zsan7Ig5waCNrn7FOkV9OfyKKYXsn5Xb2xZirBw2ESPte7KY8acE/OdUEWicOCclxCw7sOlfZJmzxNWMFQza7AcsRDOzNqp
X-Exchange-RoutingPolicyChecked:
	oSCTX87EAJizU/3oNhcs6Cy95fadHw7/NnJfBmWmKpqup0KAkAJtfW1/GelF6y1yjAVhqb066HCmRWGGm0lGfUcTNZNZpzg4MT8zGlVfEsTXFPnOyBr8SV4t4ubxtBePO1xxZEEa8mgEREo+O8CGX1BsP6oMc3vv9E3ogPWM5dwTo4hz3FWAC8GvbnTEtXCTqqD+9Bwn4C4uEVbZwgXY0dFDW78YLtC4hQ5VpKNNkGsHr4ugQdAfVpKUfAahTk8iFizAN+T9EaiJDTvdJWtV/1tRTRHi1iSRoTDaPun7i7MuyA34d+yV0zdolrMLr5IaC8H69ImlJ1p73uFxzwEFeQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 20:52:54.0316
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a9c83eb0-f854-45ad-d724-08df4035c1f1
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000144.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB912210
X-Proofpoint-ORIG-GUID: swhzuWrohwxTv5TwJmMR17eK2KePG815
X-Proofpoint-GUID: swhzuWrohwxTv5TwJmMR17eK2KePG815
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA4MyBTYWx0ZWRfX85nAKv/B0WDO
 N1/BZxYpfI9ouY0dHY/DyxpZxO745ZAg+rTB/9Om48BtQiGMkk889byYGrieiHIUBrTH2JdC7Vt
 2itdMBA9x1TiQX4XK7sidOCm+TxWZshwkfWhyOUD2nvqUAYaQjaU12f6sB902Sm7KEJLtvDCsfl
 VMnWLVdH9MqBmFEVoiDO49QC4A2tBipzhcjOqtn3n62tCg1vSgQ2nvR7yDJtOMcbfYh6iI58w4c
 f+8Yx8wyuV+oVMmaeGnyPhzEUYjeYVzTVkPB3MxDb0BrfskrnkR9wlVwuN30lY/hbHR32tKw1pM
 qh4rScUaz2enaz+M1fSC5rogjFQnij+XhP/iLr22qkqrmo1dKwhcbcGwUPaSe8whGLr61Q8wMYD
 OWUOvCuJAbUoYnCm2svqWhTjP/LAXfLRyzqFIt+fmWbpk6HV9/AmD0ayqPTjca6K9ALKIJA4CP2
 KfdPW9rkpzswtcM3rwg==
X-Authority-Analysis: v=2.4 cv=MpLHeGae c=1 sm=1 tr=0 ts=6af4d5a9 cx=c_pps
 a=9TxNVFKjsEmGPsTOmRxrqw==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=sozttTNsAAAA:8 a=QMtLPv9jhECbNKMvJYQA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA4MyBTYWx0ZWRfXxPHBt1wtlwUc
 VBDdMp1Qx4UGwbQg86eRukwriDGFo1az69/zkDVeVoz8IfXpVAX20UC1htw077Z7ZPEZWZwtQcn
 USzEXhCTI8eMR2AeQGJrKqSnbunOAaY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1011 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110083

The C function i2c_match_id() is slated for removal, remove use of this
from Rust I2C by directly finding the matching ID for I2C clients.

Signed-off-by: Andrew Davis <afd@ti.com>
---

Hello all,

Looking for some help on this one. I'm working on removing i2c_match_id()
from the kernel for various reasons, and ran into the issue of it being
used by Rust through a binding.

Wanted to try my hand at some Rust code and so tried to recreate this
simple ~7 line C function in Rust. Didn't go so well, tried writing it
by hand and got something that built, but a quick AI code review told me
every single line I wrote was wrong :D After some more fixing this is what
I ended up with. Seems to be correct but having a hard time believing this
mess I came up with is really how Rust should be written. So any suggestions
or hints on a better way to do this would be very welcome!

Thanks,
Andrew

 rust/kernel/i2c.rs | 33 ++++++++++++++++++++++++++++-----
 1 file changed, 28 insertions(+), 5 deletions(-)

diff --git a/rust/kernel/i2c.rs b/rust/kernel/i2c.rs
index b4ff25c830fc0..acf96887253c8 100644
--- a/rust/kernel/i2c.rs
+++ b/rust/kernel/i2c.rs
@@ -197,12 +197,35 @@ fn i2c_id_info(dev: &I2cClient) -> Option<&'static <Self as driver::Adapter>::Id
         let table = Self::i2c_id_table()?;
 
         // SAFETY:
-        // - `table` has static lifetime, hence it's valid for reads
         // - `dev` is guaranteed to be valid while it's alive, and so is `dev.as_raw()`.
-        let raw_id = unsafe { bindings::i2c_match_id(table.as_ptr(), dev.as_raw()) };
-
-        if raw_id.is_null() {
-            return None;
+        // - `name` is filled with `strscpy()` when the client is created, so it is NUL-terminated,
+        //    and it is not modified for the lifetime of the client.
+        let client_name = unsafe { CStr::from_char_ptr((*dev.as_raw()).name.as_ptr()) };
+
+        // Get the raw pointer to the start of the C array
+        // It is never null as it points at the start of a static `IdArray`.
+        let mut raw_id = table.as_ptr();
+
+        // Iterate until hitting the sentinel entry or matching the client name
+        loop {
+            // SAFETY: `raw_id` points to an entry of `table`, which is terminated by a zeroed
+            // sentinel entry. We never advance past the sentinel (see below), so `raw_id` is
+            // valid for reads. `name` is NUL-terminated for every entry, including the
+            // sentinel, which is all zeroes.
+            let id_name = unsafe { CStr::from_char_ptr((*raw_id).name.as_ptr()) };
+
+            // An empty name is the sentinel: no match.
+            if id_name.is_empty() {
+                return None;
+            }
+
+            if id_name == client_name {
+                break;
+            }
+
+            // SAFETY: the current entry is not the sentinel, so the next entry is still
+            // within `table`.
+            raw_id = unsafe { raw_id.add(1) };
         }
 
         // SAFETY: `DeviceId` is a `#[repr(transparent)` wrapper of `struct i2c_device_id` and
-- 
2.43.0

