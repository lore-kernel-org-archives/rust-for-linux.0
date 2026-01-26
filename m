Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013028.outbound.protection.outlook.com [40.107.201.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A1428C854;
	Mon, 26 Jan 2026 03:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769397861; cv=fail; b=ReWys+GwCFuAHMd577s80LAa37WcGVLojVtAqZrug9WvT+OqYxoh1tMBgQWOAJ/pf2MK5yNFeUvEbFqnUJs7hMeAm6gWM3eZhEoBXI89IlqQqXsRBC9vKBxjTV92sl6grFa7esDEBsODDByyGYEjhgErCeamxMO8doptgnzFAiY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769397861; c=relaxed/simple;
	bh=D+/Y/zx9QLWnT4AEmjlOzNlTbZJKl5zpl41Iyd8rvzo=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=hS01upzYKL9qJP4bWz7C/YKyboGqM3VHhh5k6tnk6iDBTbbiZDf1qqLwouT9AcCWQiNxfGLy+a8xbNZc2V4bOgbq8Veqm5jJ1qDSJAvTLraKm7/WgH297la3fIgXVYqjl559tV4HCt+JFMVOXBfd4Mdu1WynFOtpxYb8wsmPVGc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Ww/Vd7Yn; arc=fail smtp.client-ip=40.107.201.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Ww/Vd7Yn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mL6sPuP85EKMyzK8+yqjO2QATscggJzEEeYqxZLyVc+EeRZU7J7r1hNCbiDWQuV/bhXJIheVXObepJVAu7Vc8RsfqmCrImm6xLjHUd5C8Ho7U/3MCGT6/lF5gwv5R/x8ItfmhwlU1WvO+xUZy/Fea6WXLHhgsF1mZrhiILJE/OC224QqW1Kxoqoxt+ySZVeyElg0YEnZPzTP584i+V82ySWwDs0hqbJXFthyL+GLrIEYqjJ0hX7balFtHHSDrnrKCD+5e2Mi+MnEYuhC9R9qReEJHbnHNBHcPDKO4RxtaQn2b8MQB5pMPaqGaLM7a97svlgTuOFYfEckoDgeNDwWdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EEsO/g67ZREjQcua3Y7sZGiS3DjVCOJE1W8cXkH5U5U=;
 b=ZmjP3PSk9vSxcjzyMfK9jCmL62y9yWXeYHkhQlDWgWYvAY8cP30Aa+02DVcB5A8MNLjDxJ3C+jiAYBcL/fAFdZZ9QLtrfrPbNsjGYYPGHFMnlOrDGRG8CrqUzrO2PxC7H/DUPqiHQUfVc3sxWR75C+vzU5oHAX/buOtxGwvp9oUDGoNSnZgwxP6m7pgE435oPYfEsqZQOP0dvVEWbd54gna3aYYeRiBMBwL1iA5qwlGMYdRL26ucL+/ZfLNN8LVI33Xj6RdWVw8Ot1OAy9+giENawdzVFYIAIPpoMyMJ52gsENOUXxjmBHoTLa0Jhtt1u9t21gbdw7YH1pDbebju2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EEsO/g67ZREjQcua3Y7sZGiS3DjVCOJE1W8cXkH5U5U=;
 b=Ww/Vd7Yn3UhVtsMXmTAeBJ2bcbuR7mMkGDapFBcpsbtYRX1MQOVvdmNi1750veaBRNOeRgSJO3PYM3sZcybQ9IRMPX+RCpZeLLx9H6bR7ZOhago2cdTDgLaOxn2rMdqrU9OLTqNDI6zFr4CsgbLsNo4Bi4rdT2Yi1kVsVsrG6Svk3j/40IakSFhIoKXiOJGXJR6ht6VO4/9r5BV4SQL+pOvsQgY6lFu/8PO1StQNvIlvqYDJcpMJn3UNClFX9gY0vbKlT0OEBZZT9PG2MBdAMKMx1zeUaAh/Iwy0KG76TyWcITjDVXDN1fe1yZxuBWpolsV++NFKaKbeMz4J0/oBVw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB8124.namprd12.prod.outlook.com (2603:10b6:510:2ba::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 03:24:14 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 03:24:14 +0000
Content-Type: text/plain; charset=UTF-8
Date: Mon, 26 Jan 2026 12:24:11 +0900
Message-Id: <DFY76VCL7KO7.29FCRAOOY7FVN@nvidia.com>
Subject: Re: [PATCH v2 4/5] rust: io: add `register!` macro
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Gary Guo" <gary@garyguo.net>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Yury Norov" <yury.norov@gmail.com>, "John
 Hubbard" <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Edwin Peer" <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 "Dirk Behme" <dirk.behme@de.bosch.com>, "Steven Price"
 <steven.price@arm.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
References: <20260121-register-v2-0-79d9b8d5e36a@nvidia.com>
 <20260121-register-v2-4-79d9b8d5e36a@nvidia.com>
 <DFUCNHHYB6VV.43MOY4Y1NV06@garyguo.net>
In-Reply-To: <DFUCNHHYB6VV.43MOY4Y1NV06@garyguo.net>
X-ClientProxiedBy: TY4P301CA0005.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:26f::9) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB8124:EE_
X-MS-Office365-Filtering-Correlation-Id: a2743aaa-b910-4bee-c49c-08de5c8a6185
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|7416014|376014|366016|1800799024|7142099003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cDdKTnJ6ZkYwZzBTL1NMM25KUlB4aDVXUkY2c20xbGdhVWpKTHc2ZjE4VDhm?=
 =?utf-8?B?NmFVZXB6WFFnTUlvQWdya3V0STBldUxIakFqNEx3K1dsTjcvaVZKZ0hjay9L?=
 =?utf-8?B?NjF0eHBDcjBWSHU4bXY5U3p0Z2VDbldnQTRSTEU3eGNGWXBoVHZ4WEhhZHdr?=
 =?utf-8?B?YzZWMzhPK0RaYVQzS2pHM25HL2o0VjBKblhBM3N2WXk2SnRsSk1zclY0K1Zs?=
 =?utf-8?B?VHhvaUxjK1NLdDlkUjV1Y0hhTUxvVWkwMGZIaXhleUNtSXlOZytsQ3RoQUNp?=
 =?utf-8?B?Rno0R1dIendyQXRoUWhMbVpFbFZoM1ZpenNyci9oWGF1dmNlWnR1VXl6K2Vu?=
 =?utf-8?B?OE5ISTJjZ0tRN3NNYkkwZXp3aXN4VWtQOTNsTzlSUGhqRW1mM2tiZEE1cU05?=
 =?utf-8?B?UlZFcjIraFRnT2VYeXpoVjcxeFM1eERqdjUrNTZRR0lWVlNTVlNsZVRUVmdq?=
 =?utf-8?B?bXJLdzlMdHl1YjJOek1UU1hUeXkxQmFnMWwzVzlHOGxOeU9qWXk3SThWd2E0?=
 =?utf-8?B?MmFOemlpenF4Rlp6cHJxU2IrcWVDYnphbG1PaGIxVC9URlFsR0tUL1pnMkkz?=
 =?utf-8?B?T3JrZlI1R1JBTWZtMlRNYWNNNktpaFhJQ1hINEZNMzVRU09NNFo1ZzNvSGtW?=
 =?utf-8?B?dU5XdTNkdHpZS0hIMHV2UElxMDFqVVo1cEROSkxvVFJNc0ZOZjZsK1B1Z2JI?=
 =?utf-8?B?MDBqbVRzeFd0eFl4UWZrUTF0em41M0hHNVZlL0ozZWROamVXazVIaXpNK1Iv?=
 =?utf-8?B?Z29jMU1sYUZuemVjT2FYaHA0RTllQ2Rvb3ZBTW16TE1GWmdGc1BIbkNQWExM?=
 =?utf-8?B?dGtaVk85ckZoOEpNNGgxWnpTQzlmTVZPb05jdDFhYlZnWXNqOCtGdmZZZjdD?=
 =?utf-8?B?YlR1SUlHdEs0TUdxMm4zYkY0MnZpQ29MdWpTanE3WlNoaU5UT0lMUmlFYmVZ?=
 =?utf-8?B?cTZzbjBOOXpvSGdpTkpHRVFQTmk5RFpUNG9ZS0o0WmYwUURCTFlleGVKZTZW?=
 =?utf-8?B?a3JCeVEzWS9pRU5jbWtpekM3RTN4dTVZdXdrUFhhclBLcDdWcFZtSjh3dUU2?=
 =?utf-8?B?eVdROHVabzBITFVVb1FXRzR1bk9xQ1FSdTVSOFU5OGczdHhLV0pJdE4yZFA1?=
 =?utf-8?B?MFp5a3YvWHBrc0RqbnBFdy8xOWFNcXd4eHV2WUVPeTB6WHBYQlExby8yODlO?=
 =?utf-8?B?MDRxeXZIcTlHU0l0dXBLM2s4d3FYaWpsaFhvQkE4MTJMcGhDSGxmRnFxMS9U?=
 =?utf-8?B?WlpvVkxZY3kxdGZqY3dQaDRyalp2N2pqanNLVUxDTkF5Y1p5MFF5V0hFQzRa?=
 =?utf-8?B?ODZsVUd0VlFrdUJWWFJ2ZkpaNXV6bUtnN1FRd0RhSGdDTUFLeXhKbitjR3BD?=
 =?utf-8?B?U0UzRE14SUdiRDJTL1ZubXE3RXBNSkszYzIwQnhpYUQ2SzR1TS93WE9TUGdk?=
 =?utf-8?B?NXNJckxyMGdHcHZvTkVvdUMvSEZHcEd2dDMxUFVNc0l6NWhGcWZhcmpHLzNi?=
 =?utf-8?B?Wlk3dENySnhWdVB0dkphTVRMOEpaV0JkZkwycjFKdEpGMWxHMkNERnlwWkxk?=
 =?utf-8?B?NUg2WGdnQmJhMTRKWHhtR3VnL09OSUdwTUxIM2E5UFRReDRTejN5NkxiN1VX?=
 =?utf-8?B?TmVsVjJLN2EvdTZRcVZ1eW5zaUE1dm0rYWVrZWE3L09XM1hDYzgxa2MweVFD?=
 =?utf-8?B?NldRSmpXNzgrY000eWxIbHl2ZVZiUVlMdkhTQzNXSCtRbzRzUStYU3lHUlJ1?=
 =?utf-8?B?TExZYlpzaGtuVGNxc2dTeFhXd1lzMm9LeStJTTlmTjI4dExNa1R0dU5hRDR6?=
 =?utf-8?B?bmlYMUxBSUgrZStNVEt2bE5pSFh2eEZxNERvOFNrUHdBYk9JSlRISFk4aGJm?=
 =?utf-8?B?MEMyMnh1cCt0WG1VcngzSzEzS0t4RkVRK1NVQWRNSUt4OTMxQjVXUWdsMW5u?=
 =?utf-8?B?dXNKVGM3R2Uxdjh1TUdJQjFkbXRWQlhERXl1VGs3b1UxUDNxYm5jbTVyblRR?=
 =?utf-8?B?dTZnN2EyRlhDYy9PQnpvbXdKYzlHd2hNNU1KUTNudlJqamdKOUZGUjY2M1Ba?=
 =?utf-8?B?Y3RvQ2lUOFlhejNWcTI4YkRUUUM1TXNUcXd4Zk5MdUZFSUoyYVdISkdZU1dp?=
 =?utf-8?Q?o4Ys=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(7416014)(376014)(366016)(1800799024)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eWRJSzRNVk1UaVYzTjdZUkhTYVVtVDZIQ3E0Uzl2cUU3bUJXd3F1S0JUaFZh?=
 =?utf-8?B?TG91SEtaTElUT251VGx4NHNRWTRWditqVnQxNUlubmxybG5aTCtzcEhuT3lx?=
 =?utf-8?B?Tlg5eUZtL2hBNUxKRklkWXkwbWZaSWl4U0ZMdTMwTW1ya2szbjZwSjc0Zm1p?=
 =?utf-8?B?R0JzTnRhNWxNZTFMN25VVk12QStKcXpOdGpaSTFMWjBSTkxidE9NN2k4S3JG?=
 =?utf-8?B?Q256RzB5eE1lWEd6L29OSU45cUFNaFF1OStnZVVuMGtCZ0Z5RVpLeUVnMXhW?=
 =?utf-8?B?ZDVjNEY2c3Vsck5IS01teTI2UkJzZW11aUt4Mjd5U1RNS3cvTlZDOXovMFVY?=
 =?utf-8?B?eGRHRGNPSVVEam80eFF5WHFjTlByU2tTSzl2MmZ1aXZ1ZHN3bW5SOGtRblZ0?=
 =?utf-8?B?NGM5emJ3Y3dlb3huT3A4RGFPTEoyM1ExS0xwOFprekhNWDBkenN2bUpyRnJ5?=
 =?utf-8?B?em94NWY1S3ljbzVvalVXN1cyd2E3NkdLZ0RPNHNYbVorS1U2OVFTNjFYWlFP?=
 =?utf-8?B?TytQcEJad1hhUFlxb0RweWdtSDh5dENmYm0xZWxEZkZoK1VWK0RuVFpwVlZ3?=
 =?utf-8?B?UzNoL09iVDVwN294bEhYcjNVSzNWTjUyeWJYYTJFRlZJK0kvYm5raHpFbWcx?=
 =?utf-8?B?Njk0UXYzckpKWFdhYVA3L1FyN3VNM0xjMmVWNjNxbmcrRmlCVkxldUNoODQ0?=
 =?utf-8?B?MjErakIra3dzVjJuWWdnSG1qTlNwWTE1RnUwN2ZIejdGMnMzZXFSd0FEZytI?=
 =?utf-8?B?ZFF5NkNYMExLcUhMdnhFNUJEVTdBN0FHbWt6L0JUbkZPRDRxSkJXSTduaGww?=
 =?utf-8?B?RVkwbSttMUoxWnlVaUNRd1hiMHZlVzJBVFZ4cmNWeGxyei9hMkptTkYwdko5?=
 =?utf-8?B?Z0theUZPK2pSaGdtY0tzWDdNQmEvNVJPL0t1T2hHY05KN1hqdTZoc0NMUXRG?=
 =?utf-8?B?R1ZOZFQ0NzNoQlBNU0FlU1Y1NXpBamlxM0ZMaWowN3lZSGsxZFhEckpsakth?=
 =?utf-8?B?WksrVWswbmkrSjE5Vk5xVEZDaEU5TzhIb3A5L2RvdnpUTGgva3pmSmhVWlRr?=
 =?utf-8?B?Rk14RnpWd2gwWmptajlnN2FrRm4vTkxxNzBKV0lGUTJRYmY3MzJHVW5vSVZh?=
 =?utf-8?B?U29xRFNwZ3pDN2NHZUJrSGg2RTRCZzI5QU0zVDBjQW9lN0QyRGRpdjRBK3Rl?=
 =?utf-8?B?OFpwOWJ3Ym8yeUE1OHVTL24xeDh2d2ZXNGFXUnlySGZUU29XcGRyUUxZZ1JP?=
 =?utf-8?B?TkJnVVFOU2Y5eDNtWE92QWQ0Rm1WZG9YcjdLb1lZZEJGZ2s5aVllOC8rUDdj?=
 =?utf-8?B?bnFLNlpTbGJCbm9Ya2w4VWV4ZzFnV1czL2NKWDh0REpScTk5c3JPZ1I3RDF6?=
 =?utf-8?B?WG1VNHR2QTRBR3Foc05wZElpMExzczNhSTBlNXJ0cWh3MXpoL1ZJQjlsL1cy?=
 =?utf-8?B?Rk5PaktWKzM3Skhub2NubXFTbTlCbUFLRzNqa3B6bVFsdUhoaG0xVzBYWGd5?=
 =?utf-8?B?K2cxeWhoMTV1RlJvR1kyMGdsWG5ILytOZ3JWZ21jd3E5NDhkYU1BMGNsZDRU?=
 =?utf-8?B?TnQ4L2dmZjRyMThLNXYwQjIzTm9yOHhsZFpBN3ZNUU41ZG9GWU9hcU5qQ05t?=
 =?utf-8?B?azBJQUNrVW91dzNiRWF5ZXg5ZlpLZzBlczdYVEJ6elZPcUYvL2pSbFdIYW1V?=
 =?utf-8?B?S3Z1NGd0VzhPeHhmMVZLbTBJVVBkU1h2bzdZcHdxUDQ3MnZMYUtGejZJN2lG?=
 =?utf-8?B?Szd2RWNoU0dVTzlReTNaaG1BK01taUswVjNOWllVUEhRRUVpbmFQVTVicE5o?=
 =?utf-8?B?RU5qd3dzcVpSSDN3cnlZNkFhNGxIc3F0QzBtb2k0dW9WTlE4ZTgzNmJWZ1Vv?=
 =?utf-8?B?b1BaNjR5VEVhZ1YxY3VCYzNySHk2SStBRHNReDJLb2d6N3JUM3lROVo5Z1ZY?=
 =?utf-8?B?aUZTdVAzK21TV1g5ZzVTTTVxNzQrT1hIT2ZPcC9zMHQ3YWc4YUhoUlBCZUd0?=
 =?utf-8?B?eFBva3Y2MGJUL2VSV0djbW9QbjJHTmRzZk9qSzA1WWFCT2xsUDNhZVdUQzYz?=
 =?utf-8?B?VDVnNUF6cW5iTmdIRzdRWm1kL1lweUxHSzE2QTVOdFFHYkNCdjdyZFVZZ3hK?=
 =?utf-8?B?M1Q2MU9md0dySW51bkZqZWQxeDVQaG1YRFlzWWNtNGJZUUVYVmUva0tyRWR5?=
 =?utf-8?B?aHpUc25BZkpqak5DRk5JdGNudjltc24xQWQzTHc3ZDdiYW5FRWVpVEZWVDE0?=
 =?utf-8?B?MEsvVkNmc0pTZ3J5TnRZMnBPb01EVzZwY2MvRWh3cjY2eVp2TWlvcUppSkNQ?=
 =?utf-8?B?b3ZwL0FvRUFqbWR6MUNGMDVXcGM4dm85bVQvd0thOS9pb1YwMEd6eWV5VEFa?=
 =?utf-8?Q?uzqe508DZjsNGs8D8N+r7flUprN7splDXDdHrPYv09mft?=
X-MS-Exchange-AntiSpam-MessageData-1: ZS6MvBoyhY1y4A==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2743aaa-b910-4bee-c49c-08de5c8a6185
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 03:24:14.5908
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 42VpF2THjtdADZVfirSVp2G1AQYZaz01SaJTDuBEjN4RfWHBu1Onr91iR0/A4jD666CzW5TLlZHI9ibAGVpVbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8124

On Wed Jan 21, 2026 at 11:50 PM JST, Gary Guo wrote:
> On Wed Jan 21, 2026 at 7:23 AM GMT, Alexandre Courbot wrote:
>> Add a macro for defining hardware register types with I/O accessors.
>>
>> Each register field is represented as a `Bounded` of the appropriate bit
>> width, ensuring field values are never silently truncated.
>>
>> Fields can optionally be converted to/from custom types, either fallibly
>> or infallibly.
>>
>> The address of registers can be direct, relative, or indexed, supporting
>> most of the patterns in which registers are arranged.
>>
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> ---
>>  rust/kernel/io.rs          |    1 +
>>  rust/kernel/io/register.rs | 1198 +++++++++++++++++++++++++++++++++++++=
+++++++
>>  2 files changed, 1199 insertions(+)
>>
>> diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
>> index a97eb44a9a87..eccaa176b6b9 100644
>> --- a/rust/kernel/io.rs
>> +++ b/rust/kernel/io.rs
>> @@ -11,6 +11,7 @@
>> =20
>>  pub mod mem;
>>  pub mod poll;
>> +pub mod register;
>>  pub mod resource;
>> =20
>>  pub use resource::Resource;
>> diff --git a/rust/kernel/io/register.rs b/rust/kernel/io/register.rs
>> new file mode 100644
>> index 000000000000..e414aebe4c86
>> --- /dev/null
>> +++ b/rust/kernel/io/register.rs
>> @@ -0,0 +1,1198 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +/// Defines a dedicated type for a register with an absolute offset, in=
cluding getter and setter
>> +/// methods for its fields and methods to read and write it from an `Io=
` region.
>> +///
>> +/// A register is essentially a [`bitfield!`] with I/O capabilities. Th=
e syntax of the `register!`
>> +/// macro reflects that fact, being essentially identical to that of [`=
bitfield!`] with the
>> +/// addition of addressing information after the `@` token.
>> +///
>> +/// Example:
>> +///
>> +/// ```
>> +/// use kernel::register;
>> +///
>> +/// register!(pub BOOT_0(u32) @ 0x00000100, "Basic revision information=
 about the chip" {
>> +///     7:4 major_revision, "Major revision of the chip";
>> +///     3:0 minor_revision, "Minor revision of the chip";
>> +/// });
>
> The comment is inserted as doc comment, but it uses the string syntax.
>
> I guess the idea is that you want write everything in a single line so yo=
u can
> visually align the fields? I think it
> looks fine on the fields, but the same-line documentation of the type its=
elf
> looks a bit off.
>
> Something like this will definitely feel much more Rusty:
>
> register!(
>     /// Basic revision information about the chip.
>     pub struct BOOT_0(u32) @ 0x00000100 {
>         /// Major revision of the chip.
>         major_version: [7:4],
>         /// Minor revision of the chip.
>         ///
>         /// This would also allow you easily expand the documentation int=
o
>         /// multiple lines!
>         ///
>         /// Perhaps useful to document some quirks about the register!
>         /// I know currently registers and their fields are very underdoc=
umented
>         /// and they probably don't need multiple lines, but I hope that'=
ll not
>         /// true in the future and we would have detailed docs in the dri=
ver --
>         /// in which case visually aligning becomes impossible anyway.
>         minor_version: [3:0],
>         //           ^~ closer to the variable syntax in Rust
>         //             ^~ I keep the hi:lo syntax which I suppose is to r=
eflect Verilog.
>     }
> )

That would definitely be better, unfortunately since this is a
declarative macro it cannot match against comments, hence the current
syntax.

>
> Another top-level question I have is whether we should define multiple re=
gisters
> (perhaps all) in one macro invocation. That's the strategy of `tock-regis=
ters`
> crate which is widely used in embedded Rust.

I agree that would be nice, especially as it opens the way for better
syntax for e.g. register blocks with a base.

I am having trouble adding that to the current design though. Some rules
use the tt muncher pattern and these will greedily consume all tokens,
including those for the next register. I am a bit at my wit's end here,
but if you have an idea for how to do it nicely then by all means. :)

>
> (Although, they use a completely different strategy in generating registe=
r
> mapping; all registers are becoming fields in the same struct).
>
>> +/// ```
>> +///
>> +/// This defines a `BOOT_0` type which can be read or written from offs=
et `0x100` of an `Io`
>> +/// region. For instance, `minor_revision` is made of the 4 least signi=
ficant bits of the
>> +/// register. Each field can be accessed and modified using accessor
>> +/// methods:
>> +///
>> +/// ```no_run
>> +/// use kernel::register;
>> +/// use kernel::num::Bounded;
>> +///
>> +/// # register!(pub BOOT_0(u32) @ 0x00000100, "Basic revision informati=
on about the chip" {
>> +/// #     7:4 major_revision, "Major revision of the chip";
>> +/// #     3:0 minor_revision, "Minor revision of the chip";
>> +/// # });
>> +/// # fn test(bar: &kernel::io::Io) {
>> +/// // Read from the register's defined offset (0x100).
>> +/// let boot0 =3D BOOT_0::read(&bar);
>> +/// pr_info!("chip revision: {}.{}", boot0.major_revision().get(), boot=
0.minor_revision().get());
>> +///
>> +/// // Update some fields and write the value back.
>> +/// boot0
>> +///     .set_major_revision(Bounded::<u32, _>::new::<3>())
>> +///     .set_minor_revision(Bounded::<u32, _>::new::<10>())
>
> This looks very verbose...

Yes, it is a bit unfortunate (although real-life code is unlikely to be
that verbose if you look at the top patch).

And a bit frustrating as one could expect the first generic parameter to
be inferred, so we could write `Bounded::new<3>()`. But due to how the
`new` constructor of `Bounded` is declared (using one dedicated
impl block per dedicated type as we cannot use generics with const
code), the compiler requires the backing type to be explicitly
specified. :/

Once we have the ability to use const trait methods this can be improved
though.

>
>> +///     .write(&bar);
>> +///
>> +/// // Or, just read and update the register in a single step:
>> +/// BOOT_0::update(&bar, |r| r
>> +///     .set_major_revision(Bounded::<u32, _>::new::<3>())
>> +///     .set_minor_revision(Bounded::<u32, _>::new::<10>())
>> +/// );
>> +/// # }
>> +/// ```
>> +///
>> +/// The documentation strings are optional. If present, they will be ad=
ded to the type's
>> +/// definition, or the field getter and setter methods they are attache=
d to.
>> +///
>> +/// Attributes can be applied to the generated struct. The `#[allow(non=
_camel_case_types)]`
>> +/// attribute is automatically added since register names typically use=
 SCREAMING_CASE:
>> +///
>> +/// ```
>> +/// use kernel::register;
>> +///
>> +/// register! {
>> +///     pub STATUS(u32) @ 0x00000000, "Status register" {
>> +///         0:0 ready, "Device ready flag";
>> +///     }
>> +/// }
>> +/// ```
>> +///
>> +/// It is also possible to create an alias register by using the `=3D> =
ALIAS` syntax. This is useful
>> +/// for cases where a register's interpretation depends on the context:
>> +///
>> +/// ```
>> +/// use kernel::register;
>> +///
>> +/// register!(pub SCRATCH(u32) @ 0x00000200, "Scratch register" {
>> +///     31:0 value, "Raw value";
>> +/// });
>> +///
>> +/// register!(pub SCRATCH_BOOT_STATUS(u32) =3D> SCRATCH, "Boot status o=
f the firmware" {
>
> How about "as"?
>
> register!(pub SCRATCH_BOOT_STATUS(u32) as SCRATCH);

I'd rather not, this could be interpreted as the conversion being done
using the `as` keyword while we are using `Into`.

>
>> +///     0:0 completed, "Whether the firmware has completed booting";
>> +/// });
>> +/// ```
>> +///
>> +/// In this example, `SCRATCH_BOOT_STATUS` uses the same I/O address as=
 `SCRATCH`, while also
>> +/// providing its own `completed` field.
>> +///
>> +/// ## Relative registers
>> +///
>> +/// A register can be defined as being accessible from a fixed offset o=
f a provided base. For
>> +/// instance, imagine the following I/O space:
>> +///
>> +/// ```text
>> +///           +-----------------------------+
>> +///           |             ...             |
>> +///           |                             |
>> +///  0x100--->+------------CPU0-------------+
>> +///           |                             |
>> +///  0x110--->+-----------------------------+
>> +///           |           CPU_CTL           |
>> +///           +-----------------------------+
>> +///           |             ...             |
>> +///           |                             |
>> +///           |                             |
>> +///  0x200--->+------------CPU1-------------+
>> +///           |                             |
>> +///  0x210--->+-----------------------------+
>> +///           |           CPU_CTL           |
>> +///           +-----------------------------+
>> +///           |             ...             |
>> +///           +-----------------------------+
>> +/// ```
>> +///
>> +/// `CPU0` and `CPU1` both have a `CPU_CTL` register that starts at off=
set `0x10` of their I/O
>> +/// space segment. Since both instances of `CPU_CTL` share the same lay=
out, we don't want to define
>> +/// them twice and would prefer a way to select which one to use from a=
 single definition
>> +///
>> +/// This can be done using the `Base[Offset]` syntax when specifying th=
e register's address.
>> +///
>> +/// `Base` is an arbitrary type (typically a ZST) to be used as a gener=
ic parameter of the
>> +/// [`RegisterBase`] trait to provide the base as a constant, i.e. each=
 type providing a base for
>> +/// this register needs to implement `RegisterBase<Base>`. Here is the =
above example translated
>> +/// into code:
>> +///
>> +/// ```no_run
>> +/// use kernel::register;
>> +/// use kernel::io::register::RegisterBase;
>> +///
>> +/// // Type used to identify the base.
>> +/// pub struct CpuCtlBase;
>> +///
>> +/// // ZST describing `CPU0`.
>> +/// struct Cpu0;
>> +/// impl RegisterBase<CpuCtlBase> for Cpu0 {
>> +///     const BASE: usize =3D 0x100;
>> +/// }
>> +/// // Singleton of `CPU0` used to identify it.
>> +/// const CPU0: Cpu0 =3D Cpu0;
>> +///
>> +/// // ZST describing `CPU1`.
>> +/// struct Cpu1;
>> +/// impl RegisterBase<CpuCtlBase> for Cpu1 {
>> +///     const BASE: usize =3D 0x200;
>> +/// }
>> +/// // Singleton of `CPU1` used to identify it.
>> +/// const CPU1: Cpu1 =3D Cpu1;
>> +///
>> +/// # fn test(bar: &kernel::io::Io) {
>> +/// // This makes `CPU_CTL` accessible from all implementors of `Regist=
erBase<CpuCtlBase>`.
>> +/// register!(pub CPU_CTL(u32) @ CpuCtlBase[0x10], "CPU core control" {
>
> Maybe `CpuCtlBase + 0x10`? I think this means the offset is going to be d=
iffer
> by 0x10, not that it's going to be the 17th register?

Yup, I tend to agree with you on the readability side. This requires
changing some captures from `ty` to `ident` as `+` is not allowed after
`ty` though, which will forbid namespaces from being specified in the
type's path. Do you think this is an acceptable compromise?

>
>> +///     0:0 start, "Start the CPU core";
>> +/// });
>> +///
>> +/// // The `read`, `write` and `update` methods of relative registers t=
ake an extra `base` argument
>> +/// // that is used to resolve its final address by adding its `BASE` t=
o the offset of the
>> +/// // register.
>> +///
>> +/// // Start `CPU0`.
>> +/// CPU_CTL::update(&bar, &CPU0, |r| r.set_start(true));
>> +///
>> +/// // Start `CPU1`.
>> +/// CPU_CTL::update(&bar, &CPU1, |r| r.set_start(true));
>> +///
>> +/// // Aliases can also be defined for relative register.
>> +/// register!(pub CPU_CTL_ALIAS(u32) =3D> CpuCtlBase[CPU_CTL], "Alias t=
o CPU core control" {
>> +///     1:1 alias_start, "Start the aliased CPU core";
>> +/// });
>> +///
>> +/// // Start the aliased `CPU0`.
>> +/// CPU_CTL_ALIAS::update(&bar, &CPU0, |r| r.set_alias_start(true));
>> +/// # }
>> +/// ```
>> +///
>> +/// ## Arrays of registers
>> +///
>> +/// Some I/O areas contain consecutive values that can be interpreted i=
n the same way. These areas
>> +/// can be defined as an array of identical registers, allowing them to=
 be accessed by index with
>> +/// compile-time or runtime bound checking. Simply define their address=
 as `Address[Size]`, and add
>> +/// an `idx` parameter to their `read`, `write` and `update` methods:
>> +///
>> +/// ```no_run
>> +/// use kernel::register;
>> +///
>> +/// # fn no_run(bar: &kernel::io::Io) -> Result<(), Error> {
>> +/// # fn get_scratch_idx() -> usize {
>> +/// #   0x15
>> +/// # }
>> +/// // Array of 64 consecutive registers with the same layout starting =
at offset `0x80`.
>> +/// register!(pub SCRATCH(u32) @ 0x00000080[64], "Scratch registers" {
>
> This syntax is way to close to the base syntax above.
>
> Perhaps `pub SCRATCH([u32; 64]) @ 0x00000080` would make more sense?

So we also need to specify the optional stride of the array, which adds
one more parameter. We can go with the following though:

  pub SCRATCH(u32)[64] @ 0x00000080

or with the stride:

  pub SCRATCH(u32)[64; 16] @ 0x00000080

How does it look?

>
>> +///     31:0 value;
>> +/// });
>> +///
>> +/// // Read scratch register 0, i.e. I/O address `0x80`.
>> +/// let scratch_0 =3D SCRATCH::read(&bar, 0).value();
>> +/// // Read scratch register 15, i.e. I/O address `0x80 + (15 * 4)`.
>> +/// let scratch_15 =3D SCRATCH::read(&bar, 15).value();
>> +///
>> +/// // This is out of bounds and won't build.
>> +/// // let scratch_128 =3D SCRATCH::read(&bar, 128).value();
>> +///
>> +/// // Runtime-obtained array index.
>> +/// let scratch_idx =3D get_scratch_idx();
>> +/// // Access on a runtime index returns an error if it is out-of-bound=
s.
>> +/// let some_scratch =3D SCRATCH::try_read(&bar, scratch_idx)?.value();
>> +///
>> +/// // Alias to a particular register in an array.
>> +/// // Here `SCRATCH[8]` is used to convey the firmware exit code.
>> +/// register!(pub FIRMWARE_STATUS(u32) =3D> SCRATCH[8], "Firmware exit =
status code" {
>> +///     7:0 status;
>> +/// });
>> +///
>> +/// let status =3D FIRMWARE_STATUS::read(&bar).status();
>> +///
>> +/// // Non-contiguous register arrays can be defined by adding a stride=
 parameter.
>> +/// // Here, each of the 16 registers of the array are separated by 8 b=
ytes, meaning that the
>> +/// // registers of the two declarations below are interleaved.
>> +/// register!(pub SCRATCH_INTERLEAVED_0(u32) @ 0x000000c0[16 ; 8], "Scr=
atch registers bank 0" {
>> +///     31:0 value;
>> +/// });
>> +/// register!(pub SCRATCH_INTERLEAVED_1(u32) @ 0x000000c4[16 ; 8], "Scr=
atch registers bank 1" {
>> +///     31:0 value;
>> +/// });
>> +/// # Ok(())
>> +/// # }
>> +/// ```
>> +///
>> +/// ## Relative arrays of registers
>> +///
>> +/// Combining the two features described in the sections above, arrays =
of registers accessible from
>> +/// a base can also be defined:
>> +///
>> +/// ```no_run
>> +/// use kernel::register;
>> +/// use kernel::io::register::RegisterBase;
>> +///
>> +/// # fn no_run(bar: &kernel::io::Io) -> Result<(), Error> {
>> +/// # fn get_scratch_idx() -> usize {
>> +/// #   0x15
>> +/// # }
>> +/// // Type used as parameter of `RegisterBase` to specify the base.
>> +/// pub struct CpuCtlBase;
>> +///
>> +/// // ZST describing `CPU0`.
>> +/// struct Cpu0;
>> +/// impl RegisterBase<CpuCtlBase> for Cpu0 {
>> +///     const BASE: usize =3D 0x100;
>> +/// }
>> +/// // Singleton of `CPU0` used to identify it.
>> +/// const CPU0: Cpu0 =3D Cpu0;
>> +///
>> +/// // ZST describing `CPU1`.
>> +/// struct Cpu1;
>> +/// impl RegisterBase<CpuCtlBase> for Cpu1 {
>> +///     const BASE: usize =3D 0x200;
>> +/// }
>> +/// // Singleton of `CPU1` used to identify it.
>> +/// const CPU1: Cpu1 =3D Cpu1;
>> +///
>> +/// // 64 per-cpu scratch registers, arranged as a contiguous array.
>> +/// register!(pub CPU_SCRATCH(u32) @ CpuCtlBase[0x00000080[64]], "Per-C=
PU scratch registers" {
>
> Ah... I don't like this.

If we adopt your syntax suggestions this should thankfully look much
better.

>
>> +///     31:0 value;
>> +/// });
>> +///
>> +/// let cpu0_scratch_0 =3D CPU_SCRATCH::read(&bar, &Cpu0, 0).value();
>> +/// let cpu1_scratch_15 =3D CPU_SCRATCH::read(&bar, &Cpu1, 15).value();
>> +///
>> +/// // This won't build.
>> +/// // let cpu0_scratch_128 =3D CPU_SCRATCH::read(&bar, &Cpu0, 128).val=
ue();
>> +///
>> +/// // Runtime-obtained array index.
>> +/// let scratch_idx =3D get_scratch_idx();
>> +/// // Access on a runtime value returns an error if it is out-of-bound=
s.
>> +/// let cpu0_some_scratch =3D CPU_SCRATCH::try_read(&bar, &Cpu0, scratc=
h_idx)?.value();
>> +///
>> +/// // `SCRATCH[8]` is used to convey the firmware exit code.
>> +/// register!(pub CPU_FIRMWARE_STATUS(u32) =3D> CpuCtlBase[CPU_SCRATCH[=
8]],
>> +///     "Per-CPU firmware exit status code" {
>> +///     7:0 status;
>> +/// });
>> +///
>> +/// let cpu0_status =3D CPU_FIRMWARE_STATUS::read(&bar, &Cpu0).status()=
;
>> +///
>> +/// // Non-contiguous register arrays can be defined by adding a stride=
 parameter.
>> +/// // Here, each of the 16 registers of the array are separated by 8 b=
ytes, meaning that the
>> +/// // registers of the two declarations below are interleaved.
>> +/// register!(pub CPU_SCRATCH_INTERLEAVED_0(u32) @ CpuCtlBase[0x00000d0=
0[16 ; 8]],
>
> For striding, SystemRDL uses syntax like this:
>
>     type name[len] @ addr +=3D stride;
>
> which I think is better as this won't be confused with array length synta=
x in
> Rust.
>
> Crazy idea: is it possible to just use SystemRDL (maybe via a proc macro)=
.

I wasn't familiar with SystemRDL, your comment made me take a look.
Interestingly some of the syntax is already close to that of this macro
(notably the use of `@`). That makes me think that we should try to
align when possible/relevant.

There are also lots of ideas that we could probably integrate (like
register blocks and address maps), but parsing the syntax as-is seems
overkill to me, and would delay this work quite a bit as we would
probably reach the limits of what we can do with declarative macros.
