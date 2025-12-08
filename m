Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013047.outbound.protection.outlook.com [40.93.201.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 138D02F291D
	for <rust-for-linux@vger.kernel.org>; Mon,  8 Dec 2025 03:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765163310; cv=fail; b=s9p4wkEv3gFKNpWXh+teq24kNob7hCVnq4LXTOYSBpZIjLm7FgxabLjsZ77hox511jQzHpCD5IGMklH4C3FoPd11id0JkRUjt1sXMmyrPOgZSoyJtyIU6D7kCytS1Fb4T5MxSVzi7aIV9qqPqIkxHoin8ivt5Al3rL770NZuoTE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765163310; c=relaxed/simple;
	bh=9NOxZLk1FMawYeNltdiX+gcBCHwF222l8RkO0Ry5buE=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=DPw8jZIWTezvfLiYNpHlpL6npF8JhQPYywJuYtgprW2bcV2POCtnkIIuoIJ1j0uo7OvGGcOtvoPfEQeRdcb0TlV99A+90FjuP+kgjJC5VX0rqMJxWoOEXxQ4GtMkkzN4p/28UMxX3VSGL4DHTs0Xjxomd/SaGZ4CRoJy4raBuUk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Ku+J5syG; arc=fail smtp.client-ip=40.93.201.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Ku+J5syG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G9GFe4loonGJ9yKHl5Gox/nywuKrLQxD3XShv+V5XnhwJDaKyx1QzSh/sh+DJc0RkOoFs1fxyR/T4wNTqj/ZZFYhMYbLKG0BHjDe4TIi/Jo3X5SXZLWczug3RQ07ELsH2lIFgFPyZK3n7k3s0u/3G/D4Aludy8MPmeZdxxgdnQTiMwN8sKQiTf3/HRXrietVDRWJlXtacs+Z4dReCHyU4y8Gtg5VEF5+LwB9Qs/56f+AbL0YODYzvaGjSdAjGIu8EOVVx9QHx6pSrvQl0p0kB+eCHcZYwHLAgtj/k1Mq+cKuXEGzxdbn9X1B3AJuo+wzqM+URHV5PQOAsxi98w7PoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uQiZy6lpGYj0FmLGOCQ/YHM4rlMqAfAD5cuERZaiJDM=;
 b=LX8tQjvDk9COrmK/I0ghUsOTas9V+9n0nmFdvsMYpoMspK8VxN6aZc2BGSDB61jr3yA5hKINi9OlCu1IHcErhAyH790ZttiTaUcfO5wuaGyhG750C5sxAVm3+9HaWkATvXQAEl3/YdBOieXI0Pi6PDLvijgMuXEkNf7kRdQ749WMrdzzuVjGvPkT17RRW5fikZKqQ0Dk0oE1/+gmUqp8gYwA0KrgsVzt5/ppcUr27aXL0AOW3PIyX2/cZEHbAThPeD1w5eNYESFiE/lr3VRVS29IxqpqQsuAAkqeuXoXcsZ13vDTRuo1UJali7fKma6y0HSKf0U9tkFDVdiniJW7Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uQiZy6lpGYj0FmLGOCQ/YHM4rlMqAfAD5cuERZaiJDM=;
 b=Ku+J5syG45VUdQE/hAMrreK86TB1OVmuYQDiN5pXa/5uRVfnvHT+9/mSUjR42Yns/4QB7TMblzjvW0m32kehf7ezECyly7pN0/zkyz8Jwcovkb6YoDjXIEPAr7ewmc1cnI1rP0m8aYjECJGgakNSkPzgdNL9nSupvStF18UkAi4ymP1R89i0HvE/d78hRlLRY5ueUtWEo8DV7hPhY1XBB2dnIBSE68hw7uKXEAMneH1FgY1YOBRqjM7n1teT8K93M7J9bzoCff8zUqH/Cos3k5iZ5Uh1AZLNGQZyEA2fqtWLk8n5nU+BAOW4MxU3Z78cPgxpd5X1s1/bnm1vFInX5Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS2PR12MB9823.namprd12.prod.outlook.com (2603:10b6:8:2ad::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 03:08:26 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9388.011; Mon, 8 Dec 2025
 03:08:26 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 08 Dec 2025 12:08:23 +0900
Message-Id: <DESI62R10XIZ.245BISU72Z2V8@nvidia.com>
Cc: <a.hindborg@kernel.org>, <aliceryhl@google.com>,
 <bjorn3_gh@protonmail.com>, <dakr@kernel.org>, <gary@garyguo.net>,
 <lossin@kernel.org>, <mark.rutland@arm.com>,
 <rust-for-linux@vger.kernel.org>, <tmgross@umich.edu>
Subject: Re: [PATCH v2 3/4] rust: sync: atomic: Add i8/i16 load and store
 support
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "FUJITA Tomonori" <fujita.tomonori@gmail.com>, <alex.gaynor@gmail.com>,
 <boqun.feng@gmail.com>, <ojeda@kernel.org>, <peterz@infradead.org>,
 <will@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251117001035.4068507-1-fujita.tomonori@gmail.com>
 <20251117001035.4068507-4-fujita.tomonori@gmail.com>
In-Reply-To: <20251117001035.4068507-4-fujita.tomonori@gmail.com>
X-ClientProxiedBy: OSTP286CA0078.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:227::9) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS2PR12MB9823:EE_
X-MS-Office365-Filtering-Correlation-Id: e60666da-684d-4e6e-2dc8-08de36070e3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|10070799003|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WjdyWmtzVXRTUGNidWJPU3k5c0U0VEtuNGFsd0gyd1Q0Mnh0enAvQ1Yydkdx?=
 =?utf-8?B?MUszMENiTEcrWkV4ZnlRbFd1cVVoZDI1a0IrMitROHJHZWxQYzVwclpYMnYv?=
 =?utf-8?B?OVFkYlJuMndseFJlYzl6S3B3NmgybEYwVTFsYXhCK0dtTHU2UjFDMUNlUVI1?=
 =?utf-8?B?bnpYN2pOR0szcHpNbndMSStqaGI4bWlPREZhbmFSUGxpMVlLLzQ3WFRKTGpv?=
 =?utf-8?B?NEFlUndCM2FESWFZREhPa1dBUU5HVlVkSERXZHRqNUJuRlFsb3U5ajh2S3VW?=
 =?utf-8?B?TU05cFI0eit6ZWd2dXBVejhqUk04SGZ0ZGN0YkN1dXhrZVMyN2NXMFAvcHFI?=
 =?utf-8?B?VnBvUnlEWkxjbDhMUEJkOTNqSitFbXBldlFqRENIMUVxUTJIOCtEemYvTFJH?=
 =?utf-8?B?YWFiVnNDQjY1RG1kOW4yU2R4ZSthbW1vbkhGcVRGTVNTdUE5UG1DRmlraFAv?=
 =?utf-8?B?MlhrT1dzNDlmUnlWMFY5UDdzTjUxK3BnWGl4LzUvdFJuZTFuTTZGS2w5d3B6?=
 =?utf-8?B?VllSM1g0dHhqT2tiK3hpTXVqZVNFRkFNMUdySGhhYnRTSDlQc1ZaalpvK2o4?=
 =?utf-8?B?OUZQdmtXbjhWRXZnOW44Ri9hdFJUQUJPU1YrbWpnRyt6Lzk2bjI3SDZzUGRW?=
 =?utf-8?B?UkluTVpkUUoyc3JuZjc4c09GQUpJN28yaCtmd3JNdWNsNnNOMFFzTUdML2hT?=
 =?utf-8?B?QlVzQ1Z5bUFBdjdvL0pjQ3grVStaQ0pod0RLTnllNHZ6Ylk4YjA1WWdjWFFP?=
 =?utf-8?B?eU1ybVNQQmJZTEx2NEZJYWtZNjhjTnc2RGt5QTVlZStXb1QrMVhSWHBHUUgr?=
 =?utf-8?B?U1dVNzlYbE9yczhvQThBV252YkQxNnZwTVp5V3hiQ1hyT1U3eVNCdlh0Nlln?=
 =?utf-8?B?eXhpV2JKeW84cjBNdExJdWFWbGFoNGZ6dzlTK01kTEN4dnVCVThYTHVsU09X?=
 =?utf-8?B?VFlUeDBUL3NxV0w4Vm5qZXdncGM5Q1dKSG5EaXdtMWtZYUdnYm1IQUFtc0hI?=
 =?utf-8?B?Tzd0L2h6UWFjMkpEUDRaMm5hK09zUEVzWXlOaysxUEx5eEQ2ZFVXeWwvK2Fj?=
 =?utf-8?B?OFd0U3h2Z1l2QytQVTlYOTduejBtL2VHRmZWa2NVL3h0SDQreGhVRE94ZWZM?=
 =?utf-8?B?T1laRk5xeDk3aXZsK0FyV0g4NlVGeFcvcWcxVWdJYkVmN1doMU04eEJ0a1RY?=
 =?utf-8?B?eTVCNXZIem5Ia2FBeUkwcWtmK1czOWpSOWFFOVlDS0djbSszdm9HMld1aU1D?=
 =?utf-8?B?SG1WUE5kS3hra0JQa0tWOFMrTHJWTzJieWRPSmdmQ0c4bWVyeE55YXlhZUpn?=
 =?utf-8?B?Nm9PZ1pRZ3ZNcFFsZzNwclpIMlgrN2tiTzl3cFZOQkc4R3ZybUMwa2JRdlF3?=
 =?utf-8?B?RE04ZlJHYTF3QWxjdWRjSW9BN2lnK1o2V3NPaDUxKzhvbUlKZ05nTTdOd1RC?=
 =?utf-8?B?bk8xTS9Ba0FLODVhdnBKTURVNlpYUjkrSk5WZGloUVpyL24rUUdqYkRnTXpZ?=
 =?utf-8?B?MXZLakEzcEhPMXZnZXJpVml4L2VVWnJtaDBGeERxRjRnY3RhdEYrMnN5SHd6?=
 =?utf-8?B?ZXV3RWh1SDkwQTRUWituRjJpMFduMmFFL2lzVFdjTGpzU2pTbXlQc1d6RnAv?=
 =?utf-8?B?dG05cGtkdzhaR213RmR1dE9RUnNOemZkb2U3WkxxZUF4Mk5OYXhqaXVJOHJL?=
 =?utf-8?B?dFVaRHY1cmQxZzY2K2JDYmEvbSt1a1U5eEJ2dmRKdjZZMmJnYzFMWkg2aHFT?=
 =?utf-8?B?a0Q1VmxyMHprbFFLbktQTVVLbVlhM1dXS2VNa1RYUkkvS202QlQ3UTMxMzFa?=
 =?utf-8?B?VmJCMHg5V3ViU1loQjVmelpadXVEZjl3aTc2Y0k2Zk5mVWRRc1FNaXcwMTNj?=
 =?utf-8?B?OTl4VlkrZHd4UHRteHlNeXNGM2xNbU53bjEreTR2Z3dMUm1Ra25uTHFaSkMx?=
 =?utf-8?Q?kSrL/c4W/1KdS78n+eun+1jq0SVWeIGd?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(10070799003)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q2NtYW52TGJmKy9tenhkSTgzWFQxODFJODFhbHpoSkovQU55SHBsOGMzYm1o?=
 =?utf-8?B?d3RjMWgzeWQ1WjlwL1lSb1pIbUU0cnZFYzNLOFZZVkQ0Z2p6SENBdjIrbitz?=
 =?utf-8?B?Wms3L2hzQTJEcHF4WElRZUM3TURKNkIzRmJidGE1WHE3a3VYTkE3UVRSZ2dx?=
 =?utf-8?B?em5yd1ViQ01lS0hGTVZONW9idU9ORWdncUM4dlBWV1NYUmQ0ZjFtQTVhVndW?=
 =?utf-8?B?UGlTdWpDYkYxWGwxYVJwaDdrc0kybDRTanNsaHB6dFl5QkhTM01mdExPSjNR?=
 =?utf-8?B?QzVRQkkvQ3BTdEdPMXcvWmhaTVVKUkV4MSsrSXBvTElXYXg4a05wbVJkSlRZ?=
 =?utf-8?B?NHd5bm9MZjNZKy9oaVRQSzZ4ek9WVVJMQkFlL1p5c0R0YWJ6ODdUVGxQZXd1?=
 =?utf-8?B?NldXRWtxdko2YVFMU2dIKzRzVnFBbTNUV0N0Q0ZDR2tyLzFYUHpxU3FYK3lp?=
 =?utf-8?B?cUxpRVhYRW4wdTJJSlptS1JJQ0E1ZEV3UkYwVkxWSEx4RTkvd2J5Y1JhZWFk?=
 =?utf-8?B?NGhTT1lzWEY4dVc2YUl4YjRhNDNYRDhhYTcwMlRETmRlQS9mTnUzaVJ0N1hl?=
 =?utf-8?B?Wis0aGJWZU5iUzdJZUNMQ0RTSmdrRS8vUHBtZFBWVEhGM3oyWWtiZGEyQXpw?=
 =?utf-8?B?WFFKOFc0SkU4OEZCZUNwTnFmU3dGcFNUUnlSRnVHOFFiVkIrN3FjbHZHMFA5?=
 =?utf-8?B?alU1MWtaeXVyQkl6ZHBOYlJOTzB3MzluQ3lPU1NRSVJGOEJhNHpFMEJSalk5?=
 =?utf-8?B?cWM3ZXVDT0lUQnJlMDl1WW1oQ2FRWkF1a1BaaXhubldWSmV1WlprMzVqOVli?=
 =?utf-8?B?VEdSSVZlSisrcitPODlicGZtbHIxamcwVEp4bDRscmJLS2tYbWd2WXR0SWFv?=
 =?utf-8?B?anJKNG1CVjZuRExPUG55TGduSEJHM0JpUm5DcHVDQmtlQ2NFbHZNSUszN3g5?=
 =?utf-8?B?L0JJNjMwem8xcjZ2a1p5RkVzOUpXZmpNUG9Kc2pEVG15bEFQdkltZWZiUThD?=
 =?utf-8?B?NUtBT0RFdnU3cUhUM2RTeVIzZHg2VVVCSjNneS9nU1dZazV4dHJqenFpVTAz?=
 =?utf-8?B?Z0lDbE9yQmVVLy80M0IrV05mWm5QMW9iSlVqVm1laTc0MjhGNDJ6NXQ4NDVQ?=
 =?utf-8?B?d0NlVnpIVEpxWjBNQ1NKaUZuSmY4MjJVWUJod2NXa2Y1alhjQ3UrZWZqaGE0?=
 =?utf-8?B?NEdXREhvVDY2NWcwcXgwVk9Yb2RLajFVWVRLN2dKbG9EeGk3UzNoZHVoTEU3?=
 =?utf-8?B?MkhVSE5MdEV6Q2QvQk1mZ2RLZkhIVWMvdHArMkM1QzhXbE5GSi9pd1JScnFo?=
 =?utf-8?B?OGhiQ0dKYWhoQm1BTEFNTWM3NmY3VkVvMHdMR3lsdnFZUmpLZEVVaGZnZnZQ?=
 =?utf-8?B?YmY0SnpDSjVyRWxmL3hEZWRBZWNpWUhOTkwrRmcrOU8xeVMwS2t3WmpOSmxF?=
 =?utf-8?B?WVQycjdmV1ZIQlE0c0lFVzMvODZZaVN4aWgzQUZ2cUxwYlU5b3JEWmlTSlAw?=
 =?utf-8?B?aDErbXZVRi8xc1NmSkNKaHdxY3NwMTZlQk5GSlZ2cWs5QlRsQ3h1d3MzVm5z?=
 =?utf-8?B?WjZKWlR3ZUlNT2tNa0tSbjZKazdNV29iQzRwM1huTmVmNzlMdWhZRmMwRWJ6?=
 =?utf-8?B?Z3hTMXNGREh6QzZZU0w2N0hBdEFKRHVqcnNHcTBoN05nc3FVNVpRRlV4ZTYx?=
 =?utf-8?B?V2o0bjhUby91WTlTSllrVVpyWFdtS3UxVHJhQUZHTThPclI1NDlNYWhZZjZv?=
 =?utf-8?B?dVZsUjhvM2pRR1pQY2pJVFJoOWg0V1lDNkdXdXYrNXJISHUzczU2b0NnZlRq?=
 =?utf-8?B?bDZQT3FtWjk1RWZHVWt6dGpYUzhQeGd5MFV3cUFQUXN6V2YzcGExQllxdjBk?=
 =?utf-8?B?dVpPU1BkVGNuWmpmczRMZDJzTE5TdGtKOFVDcDQ2dGwwQ0x5NG90NGp0TW1U?=
 =?utf-8?B?V1NVMEE2d1FOS1BwVGN5SXVNc1R0SlFuUUt6S1l3SU5Kbk1OR3BVRlFFTnll?=
 =?utf-8?B?TTFSTnZTb25NeUVJcG9aMUM3Vm9zMVRLcmxDZmRzTWV4NUdyMEdhUWN3N0FX?=
 =?utf-8?B?TVhnOUhJYzBHWUw3Yjkvd25rZ0FyZVI5a3RYWVE5MTNKOHhZdXE1YjlnOW9I?=
 =?utf-8?B?VzJyRnlxZGhXMzlPNnlKQStxYktwODdueEt0Vm5XM28yY0hyVXgrSmFkdkdt?=
 =?utf-8?Q?uSho9mUfRCvQDh3f0W1c3EMmKVUvO1IpECpLdPEi0r+R?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e60666da-684d-4e6e-2dc8-08de36070e3f
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 03:08:26.7048
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oAAGumObE19olP8ggjoSgz3uKPseKpedsdRULa07xeHUw1bJrYobH6T9RP1aJivq4GFLDOpfmHJx8SHW88Ft+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9823

On Mon Nov 17, 2025 at 9:10 AM JST, FUJITA Tomonori wrote:
> Add atomic operation support for i8 and i16 types using volatile
> read/write and smp_load_acquire/smp_store_release helpers.
>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> ---
>  rust/kernel/sync/atomic/internal.rs  | 48 ++++++++++++++++++++++++++++
>  rust/kernel/sync/atomic/predefine.rs | 14 +++++++-
>  2 files changed, 61 insertions(+), 1 deletion(-)
>
> diff --git a/rust/kernel/sync/atomic/internal.rs b/rust/kernel/sync/atomi=
c/internal.rs
> index 6fdd8e59f45b..4c9f4f76dbdf 100644
> --- a/rust/kernel/sync/atomic/internal.rs
> +++ b/rust/kernel/sync/atomic/internal.rs
> @@ -263,3 +263,51 @@ fn fetch_add[acquire, release, relaxed](a: &AtomicRe=
pr<Self>, v: Self::Delta) ->
>          }
>      }
>  );
> +
> +impl private::Sealed for i8 {}
> +impl private::Sealed for i16 {}
> +
> +impl AtomicImpl for i8 {
> +    type Delta =3D Self;
> +}
> +
> +impl AtomicImpl for i16 {
> +    type Delta =3D Self;
> +}

I'd suggest putting these next to the impls for `i32` and `i64`, for clarit=
y.

> +
> +macro_rules! impl_atomic_only_load_and_store_ops {
> +    ($($ty:ty),* $(,)?) =3D> {
> +        $(
> +            impl AtomicBasicOps for $ty {
> +                paste! {
> +                    #[inline(always)]
> +                    fn atomic_read(a: &AtomicRepr<Self>) -> Self {
> +                        // SAFETY: `a.as_ptr()` is valid and properly al=
igned.
> +                        unsafe { bindings::[< atomic_ $ty _load >](a.as_=
ptr().cast()) }
> +                    }
> +
> +                    #[inline(always)]
> +                    fn atomic_read_acquire(a: &AtomicRepr<Self>) -> Self=
 {
> +                        // SAFETY: `a.as_ptr()` is valid and properly al=
igned.
> +                        unsafe { bindings::[< atomic_ $ty _load_acquire =
>](a.as_ptr().cast()) }
> +                    }
> +
> +                    // Generate atomic_set and atomic_set_release
> +                    #[inline(always)]
> +                    fn atomic_set(a: &AtomicRepr<Self>, v: Self) {
> +                        // SAFETY: `a.as_ptr()` is valid and properly al=
igned.
> +                        unsafe { bindings::[< atomic_ $ty _store >](a.as=
_ptr().cast(), v) }
> +                    }
> +
> +                    #[inline(always)]
> +                    fn atomic_set_release(a: &AtomicRepr<Self>, v: Self)=
 {
> +                        // SAFETY: `a.as_ptr()` is valid and properly al=
igned.
> +                        unsafe { bindings::[< atomic_ $ty _store_release=
 >](a.as_ptr().cast(), v) }
> +                    }
> +                }
> +            }
> +        )*
> +    };
> +}

Can you document this macro a bit, in particular the motivations for not
leveraging the existing ones (I guess this has to be with the new
helpers, but following the code through is a bit difficult without
comments).

