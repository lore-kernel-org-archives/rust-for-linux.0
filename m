Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794879699;
	b=yo3rvp/uMZJu0x5LG9IzmqjvB46X4AG2/BGqh7qXXS5kBB7W7uv4qB+BpgmB+BfxxzDz
	 XjxSVyd6VK+I1+yBXRTGqn+rZd5FkuoVHiH3xox4uwOvoaeqVd9zFbO/VqMkb4D4hYx3o
	 YQ3py2UWK6qqhrT69j7Xe8Q3apdb+9rlUhqOJ8Pm8o1xkrgOElbI8AmoCqV4uTZd75ey1
	 ExL/Vd2kfYKaGC9e4p9L9K+OwzlhTp/loIehjtimpvXpApvq49oCDuleLJZY52fqmr/Nt
	 MhpG5RphQ41hMTyRNc26XDmfScWS8Dk40yQ3HBIzGrsUMA4nk+OjGxRZhT/b18LsVvg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794879699;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:CC:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
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
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=hOso3Jx1+9UONweiDrZpxK3wwqH40C2uVyxMlj7rnhU=;
	b=5FOGjn/KXjF7bFvzJHQodP9VWTR0j4Flpj5WghDSGthImE2vLI2g9qRjxc9EzjMxzaoO
	 Ba+B/iEhEVYg5fw+XO2/WN+gWG1TX5ALQXEbkhMRmqzoa7H3MemfV+DxuR1kGufJYUm2p
	 aS9IbGMflF1i6bfK2lrOB3D5pzCaCff+fdWh1qQpGWPmUgEXZ/RQuvysrn0sv0SUSgUSJ
	 c6cIY9eyxau8gj1qjQo9Y9EPYLTZ9Lvw+zxdl//XL+owxaI6Cjr9EcJ3Faw0jcQQAJ9oM
	 awrVET/LvzbRtAQRnUpB1/AAX0QChdjtgXuxv265TSgrHNKRQbk7UhJpfFfArU6Aaug==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=on98eiYX;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=nvzy69Fc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D3DF606A323;
	Tue, 17 Nov 2026 01:41:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D3DF606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=on98eiYX;
	dkim=pass (1024-bit key, unprotected) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=nvzy69Fc
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH0Nfbs2237229;
	Mon, 16 Nov 2026 19:41:09 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=hOso3Jx1+9UONweiDrZpxK3wwqH40C2uVyxMlj7rn
	hU=; b=on98eiYXArqkjNTbHDBcfbzTtx8YdZbLC2UtQyTeMIGnszTl9UzatsHEq
	ZvCJjy1gXI3ODQ9B2XaG3Eb2Q62oe/KJQdjzza/8XZKv6w3gkkkv/lr4ZdGTeSdX
	4wwJPuCw7j3lX7AgAYKwgdPacznivNtn7xobcID+IGItxE4AmbC+u6fezoPIrta4
	yJRaRGD7Wij0yf1tkyLyf77WH3T35QDA2DNsHa3rFG309ZTwuM+AFi4C/ZODhujD
	LWOd4BLQ610hXxq00lajOtDHdc/uYhGE6RZoBc6Sc9WR/g1f2eGI2Agy5k4B1agu
	ByzPBGJ7a4jEMBScbZ7KaD3hra3nw==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012042.outbound.protection.outlook.com [52.101.53.42])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4j0cbj8avp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 16 Nov 2026 19:41:09 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x0CROBVit+FIYnUGV0evRDMLmVvXbeCPc7SerMQZqBDZKnrRlOg+HHD5g42Px7wGMjBEVvlc9A5b0OvUk4FVxfbJT5UCM9JNOwyA2KkD4cCvp2/P2l6ElFe3YULGhWgcozk4jH8fm1qKZr9bcFWHblKxnQTYsyIHE1yQC2hFUtTwbN3B7C/DQ2Y9Qt3Swe7+dGiYDhmnmpdHLcjPHnWSH1o9RVD0v0Wu/yJVRustJpmSLHWIoaqcNa4WxGk4C64t/QkE5RC+s0GgxBl16qCt+4Oi2b32lMkjIT5qu2xoLIXZe34VPzSt3wLO9R13i9bK9dQhMOPGETjQj6/RkQHgEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hOso3Jx1+9UONweiDrZpxK3wwqH40C2uVyxMlj7rnhU=;
 b=gSuPek2YT3TQslUjuIdK73h2MteLnm079k6UdY8PcQvJpc+Rf4KtvX2/Sri7rHZfl6pNQRgheR3hdqeVZk6iHIVbsMSAg35AgE8r341JAZM6BN9YLOhJ/559srwo1T6CQDQtTz28aQjiu5cP45fCdZe+zIFHiXvMrPlzQFavNSyF5BzlEYl/DNxV+fxy6B7V1yht4TxO7FxPKVuY5bmGGnqo6YpYOM7KjCsmA++4rHeVc75tFbujE1tI4Owz5JRPyWLbB1RPpmGF+vK0U7TWcNr3dWEL7E1k4jjk2F2TySyYaZkqvq8HiYrI0T82olbCf1Yyn0Jovh0JhkpiTzxQWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hOso3Jx1+9UONweiDrZpxK3wwqH40C2uVyxMlj7rnhU=;
 b=nvzy69FcEUIhUDdEadvundoTl6I9wjmkoxczno/dMrNEeLcyACmanymhM9HxZPw9tVfuV7yfstcKF2ufifyZOpKqwA43ysMhcv1Ufz7j72fPpLkQMrAuAbHM++NS7r7GZOMsx0G/knbotxMisBK++56H8P5uTwurkKC35TFmEEg=
Received: from CYXPR02CA0006.namprd02.prod.outlook.com (2603:10b6:930:cf::10)
 by DS0PR10MB998107.namprd10.prod.outlook.com (2603:10b6:8:398::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 01:41:07 +0000
Received: from CY5PEPF00000E7B.namprd02.prod.outlook.com
 (2603:10b6:930:cf:cafe::5c) by CYXPR02CA0006.outlook.office365.com
 (2603:10b6:930:cf::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Tue,
 17 Nov 2026 01:41:07 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CY5PEPF00000E7B.mail.protection.outlook.com (10.167.247.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 01:41:07 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 16 Nov
 2026 19:41:01 -0600
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 16 Nov
 2026 19:41:01 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 16 Nov 2026 19:41:01 -0600
Received: from [10.249.33.152] ([10.249.33.152])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6AH1f0492908104;
	Mon, 16 Nov 2026 19:41:00 -0600
Message-ID: <4ce992f0-4f9e-4359-937e-12553fa46b37@ti.com>
Date: Mon, 16 Nov 2026 19:40:59 -0600
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2] rust: i2c: Remove use of bindings::i2c_match_id
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
CC: Igor Korotin <igor.korotin@linux.dev>, Danilo Krummrich <dakr@kernel.org>,
        Daniel Almeida <daniel.almeida@collabora.com>,
        Miguel Ojeda
	<ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
        Gary Guo
	<gary@garyguo.net>,
        =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
	<bjorn3_gh@protonmail.com>,
        Benno Lossin <lossin@kernel.org>,
        "Andreas
 Hindborg" <a.hindborg@kernel.org>,
        Alice Ryhl <aliceryhl@google.com>, "Trevor
 Gross" <tmgross@umich.edu>,
        Tamir Duberstein <tamird@kernel.org>,
        "Alexandre
 Courbot" <acourbot@nvidia.com>,
        =?UTF-8?Q?Onur_=C3=96zkan?=
	<work@onurozkan.dev>,
        <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20261111205204.481923-1-afd@ti.com>
 <20261111231053.529616-1-afd@ti.com>
 <CANiq72my47EZMwqQ7+esPjYv4rcuawhXJVuptPUF-SOWWe5c6g@mail.gmail.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <CANiq72my47EZMwqQ7+esPjYv4rcuawhXJVuptPUF-SOWWe5c6g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PEPF00000E7B:EE_|DS0PR10MB998107:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bc3865c-eb9f-4b8d-ee08-08df444bd9aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|7416014|36860700016|23010399003|18002099003|22082099003|6133799003|4143699003|56012099006|261102123227099003|261028144727099003|261026121527099003|261026140227099003|261021121427099003|261022105027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	CGuAOIvl+Ga3yHSaAX6cDs9svG4Iu5/yf7CDmdmJMbPqAkBbNtvaggr0zUPdIjkEpJQo4bRYgkN3qatRoZ31Azh+GHZBZEJyCebmaYgWHFRf73JvfTJXo7b7AuAS1V3rjG5E/XIoJV0+1Ocu6951XsaR2+YFe2OLtiHMcBatU9hSsSf9FTTLgrOd4+wcktObl16nzxtDs07pwVhUyanYRKZbjVR40XNmLmQBLofNqh1+aW4r8KPeS3qr6Im/mla3GdSdN4ceg0EzqXIu5sLqg0SYu3Y/BvZkf1N7ua1yZSZpJFeyZ38Hx34jZ/ktAkqH0Hz8YK9EjrOMlLu5mUysQbspf7kodhaaEPghQR18RYKgDTgGWGjCy633rqcNrZXhuGjk1rOJ1kmkvTUf8941Lh06RiTx7xA8Gzw0oYPaR+7S5QO+iPYWdTo0uJQezrQKbJ/yKa9LSwNGNLqJEyCnuFjdkq5CNqbY5luCkLwiUI5hSHlE1RMkyjRqBbWvNGpQa4IjW2MhKUIeEZ38TKRcX/wKscslHKOlKS7Po3Mc4ibncl6o7tSfVWXFsii90Joz9AYLa2L7SpvZPViKvIx+spgJSLT0t5HZSad+6i/0EXZR19oZPnCNamXnFyd11d86NzKUBKUsJ/4vHjUWJftQkzTgo3EEI5SIH40heBNEV+K9wS+kLGm6cfGOB9TZOeW3P++4a3GN9V/fYE2Vg+RGzA==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(7416014)(36860700016)(23010399003)(18002099003)(22082099003)(6133799003)(4143699003)(56012099006)(261102123227099003)(261028144727099003)(261026121527099003)(261026140227099003)(261021121427099003)(261022105027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ptJoaTDsHq3aFBF6o7nftBDGTOu7ufN9ZMiQe9fFQcOWeH9a2L8K8x3xdMmXkT8qLBXlqiEKmMzZKUczenrWdLnIMvdIzk6+ITOhk7ci5pHeebSccfR9wqDx0i77t2mmP/y7Nq1AZm8OIrzxvgP1x7OiXlBk5s/JwxhZhIl0cUEzn9/pXZ2PYFIMzjvAab0tQH5w31oy2Qo8UoBPhYIyu62Uh17lvJeTOsv9qfVB/u5fJyQW95GVS/MzZp41uzFC7DBs3kA11ZOTAL0QF0v3DjzV3WhTRrN1pUiK4k185EFFrCCxPMc0ITmbKGAlrBYfcD0EALNk+WQnvvHEDK3WQygqY23bfzC1vRHtGcfxXJ9Y1bmncpdcQ2gibIoE7EJQ3iLbdcD7t08/uMuPRmUEXKxE2KkUltGOmaogfvY7iZcd5h/aj1zd5oNP0nddhx3l
X-Exchange-RoutingPolicyChecked:
	I5S8FGDuBYJ/xi94H7NrttRDanS6whCLWyQS4YWfSXuhgP49VRVqOKNo+WVCB7YX9CNMVopVCxsZkRtldZr31JoROD14EcaV8V1tjrPq+Tv5T4hK9MCzNYjk0AduhI0v+VvxaxXkGzikyLz8L/C2Q28+miJoFJjfayfrNiE+jU/66572tafSI3fpya5pfHN4iVHDU0zqHDF+TVXvYvFlqaRnm4/3ITOWjJYwjOp5Ik7WEj4tYANg0sl/0MrtQqHXsljWCvJAR7x+Q2tRTb19Q/reW+dLFp5pYNAgIRzXBx3/1isjrLWNeDbLrPFXtgUBUJtlMco3rdgUWRJ05ryfkg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 01:41:07.4045
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bc3865c-eb9f-4b8d-ee08-08df444bd9aa
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY5PEPF00000E7B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB998107
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAwNiBTYWx0ZWRfX9dqG4ngiXHwN
 VKUrmnMLQSQx9uZNhGAioQySERtS2S6a4a7qA9/Q1k4pIRpqQdYMcPkz0mMLeM7esm+38PhtDAV
 ME70RlH762en3zy5dSsB5AH+oZJ6LLofqlIDk8SC9q18YIH04P3Jjto1B5RLHYLqITDtuc5cLXQ
 T67p2dKayux7Ob8IyePT2tzSTnHVeq00j08JVw2jVlj87Ym7LqRYsl9HrU1XEtJhxwlnHvFRUT5
 VpXsshz80AtmLQ7TFqhpz3U0XN8ucbReNNLs24U2Gl48wX0CItIyHSaTBsHhNub+xUrC3jnbpPX
 6gIYTdMSffiQ4pMdmGV0bzOzAGuUPz4jXITCyyOggotH4/pXkRxuRb65D65XGg/djO8qNO9ZzeB
 sc4XNgNUPir1dkkPZwB2zx53ltT5dMOXIaA4+DRx03VmlhFLriZ+1rumh5JZUPtcG7OeCZg6R52
 Ry9QwjYdjfSvs3Q+ahg==
X-Proofpoint-GUID: q2TeqcLL7xHVtLEn6pbvuUSLKu5QSSV2
X-Proofpoint-ORIG-GUID: q2TeqcLL7xHVtLEn6pbvuUSLKu5QSSV2
X-Authority-Analysis: v=2.4 cv=F7fC5ahN c=1 sm=1 tr=0 ts=6afbb0b5 cx=c_pps
 a=FJ4pSz/mJ8rARZfoadKCzg==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s63m1ICgrNkA:10 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8
 a=iObqcnVRR3L9L9R3Yd8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAwNiBTYWx0ZWRfX9vX6ohu36o8q
 dpVx53zcEVbXUUARJN8bGmVsDzg2DCoNtZQsxESDDv1vGGYGCC81PV7NYyUWZPxPhpqmEZDaSXM
 U/Gvj+Jyvo5nM6ezvP14bv/u3BBEax0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_07,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0 bulkscore=0
 clxscore=1011 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170006

On 11/16/26 12:25 PM, Miguel Ojeda wrote:
> On Thu, Nov 12, 2026 at 12:11 AM Andrew Davis <afd@ti.com> wrote:
>>
>> Well Sashiko suggested I take the easy way and just re-use a different C
>> function instead of trying to open-code the loop in Rust. The C function
> 
> I noticed this series while going through Lore threads, and yeah, it
> is generally better to avoid re-implementing logic in Rust if a
> suitable function already exists in C in the subsystem (unless there
> is a good reason to not do so, of course).
> 

Perfect, sounds like v2 here is the right to go then. I'll resend
this RFC as a normal PATCH then.

> By the way, while the maintainers may already know about the removal,
> I would suggest adding a Link: or commit reference to the patch
> removing that C function, i.e. to give context for others.
> 

It's not been coordinated much, I've been just converting drivers over
to better functions until there are none left using this old one. Then
will send a patch to drop the then unused old function. Only a few users
left after this Rust one.

> I hope that helps!
> 

It does, thanks!

Andrew

> Cheers,
> Miguel
> 

