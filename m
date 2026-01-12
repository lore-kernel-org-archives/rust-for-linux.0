Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022137.outbound.protection.outlook.com [52.101.101.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B332D7DD1;
	Mon, 12 Jan 2026 16:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.137
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768234457; cv=fail; b=j/2+HQjgVwe79R+8DACRzawCMptDFStDC1vlhNiWsd88K81xMCEAqH88kwmFYANpNhss9zGDVKMcj5qibHWBHCMcgT23Cwzq+nFIO74GYlmJBdyXRKqw2g7bk8SDWfk7uNu3sFBVhXLjMCVpiBPtpb8uyzyAGosR4S+3Az128uE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768234457; c=relaxed/simple;
	bh=c2XrqgzjxF2G/zrRxeBA0J7OmaQFykfXd7eN4hEsm0s=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=dRuT/+K1hpmUfsL7+ePLItewYUugR+eD8+ztELKWXUoFU1nPcAgsQCJ/rEjMts6BANbilxlgmQEcr88X01ZGP9mEDYYAMzrvx2E+clbZXz4xA58SSEq3KQo/yZxBF1wNFtXNfCWWnLY5VwnFUU7VJeF5VMp4JS7yyXnBFahZIEk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=Il7Nqi3v; arc=fail smtp.client-ip=52.101.101.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="Il7Nqi3v"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bzIllT66MI6MFv52ks4q02Vm4qOXBrI0VZeeZmmwPdCes6whfUCseu+UQGYLpd9MUEnvf/jezyHN91j7EHfcmppUO0UwinB6e4WqY1+9WBaS5f6wWpxcUy3nYbMSeu3ae8E462q00quDyyWPlGyLC6Wz92pTiXCmimOP/yIPb05Abx0Qk1it34AKyrBZpPIM3//lmFyLNGBru5JH++702tFzE+um4QE3Bl9gJ/RZWqsDp1+jXNRDxK3MZRQosECScKuSHggBmKSUS96U+UhC2D4A5zGxiMXoVISPQIZdQhiguH0sDv/StswUcks7vVifJ5SkeDEwzrXu0DKsEcImKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VuYprf44fLuarPztgntlXKSZ8jjgAtcthb68itJ7Ds8=;
 b=r9OQeIZvzQ6h6K4Urn5q68miwySLW+mMo1ZfFq6wZ8e0jkZEcKTLuw+lMy2bRCFF57GKzvCMTo8xj1+GMFi0wyar4WwSSHpr3baSn5S0/LFY5ThN60Fnhw6Eb3TyBZdmQeGi/grBYyMoPlERDI0G/tNf5+fbfwJn5MzZscDkBcI4eJwAEjOtDSNVdKYcIOWpo7BK/uOXotKDoIvE1RIVSQFLYkf0ljLBBe7kVglBaPabfVDmT95v34uwm+3IGEIyU2pO9umt9E88gzs0pxP/fPdhDzsXE8p5EESITIc8JL8u/4ZO4xIAMfb4q1AcFlBcjUtPlYWxIhmtg9nqNZtImQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VuYprf44fLuarPztgntlXKSZ8jjgAtcthb68itJ7Ds8=;
 b=Il7Nqi3vJXuqsDFGzXixprHdxbL4vUBK58LSDR+2/UK/DTYuYow80RWWJMwc0XPwJ//A/hqo2bMDDlOpqpI+J29kuZpDfaleHPcxjQLXZWLeFoPqguD69RjdCON+jShPm5UDz4VwvYnq/BxZYZA4vYRH/GKRssPJ84EkV25lnzI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB2737.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:a1::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 16:14:10 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 16:14:10 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 12 Jan 2026 16:14:09 +0000
Message-Id: <DFMQSS27GS7G.1QA2Q44B7UAT0@garyguo.net>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 04/15] rust: pin-init: internal: add utility API for
 syn error handling
From: "Gary Guo" <gary@garyguo.net>
To: "Benno Lossin" <lossin@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Fiona Behrens" <me@kloenk.dev>
X-Mailer: aerc 0.21.0
References: <20260111122554.2662175-1-lossin@kernel.org>
 <20260111122554.2662175-5-lossin@kernel.org>
In-Reply-To: <20260111122554.2662175-5-lossin@kernel.org>
X-ClientProxiedBy: LO4P265CA0272.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37a::12) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB2737:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ad3cdf2-7652-415d-03fe-08de51f59ea8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|10070799003|1800799024|921020|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZlBLQ3lKT292SHB3eUxCUnk1cEo4aWo0STc4cTRFS0VyQkVTa3ZZN08vUmht?=
 =?utf-8?B?dGZ6WXkrdXJSR1I5bGhPOWt6MGlkTC9iQllwY0h6M0JDVmFCNW0zRlU2MkY5?=
 =?utf-8?B?ZkpIYzMzZ0xxcDVNKzA3YWc4WDJ6TkpUSWRsUThDQ0RMd0dKbXdzRWtXTnM2?=
 =?utf-8?B?US9XNDYyTU8rUkZKWFRTcTlSQzI4WG5GZnBYbmlUeDluRmFrVXdPcmJaekVJ?=
 =?utf-8?B?WFpNYWNJeWcyU1I5VVV3WitXKy9YaUk3S0R0NC9NMXJXUjdjY1dzLzgwK1Fu?=
 =?utf-8?B?d1hHbUVKWFQ1eFgvM3pNWTY5UXB4UC9BcnZyMXZBa1U4MU5UaDEzL25HT0tB?=
 =?utf-8?B?WDJOalQwbE95VDdmTThDNXZvb05hZ1I5d1NwbDBiaXNYVm5rK0V6OUx5dmhB?=
 =?utf-8?B?M21ISXFIL2RBdkZhTXZmazd3djE1cGcwWnZ0T3dQYjNqRGhpQXJOUmpVVE9H?=
 =?utf-8?B?UlJPZmUxNDBiMmw4V3ZUQXQxWmZzOHlJQSsyemlDcWIrbi85ZWN4N0huVVlM?=
 =?utf-8?B?dEFtcFFqSDdzcUJyN2tyWmZqYlFaK3F2YkNNcFZOb2l3ZSt4SXJ4cjNvNmZh?=
 =?utf-8?B?UzgvdEQ3eHRlZ0lkVS91U0s2QXNuOVhscDU2Z2ViSGFnTWRhczBCa2kxUUN1?=
 =?utf-8?B?QzR4eGZIazRGVGN0STA5WS9YM3RQNitLd1MyRm83T2xmWkRRYVFPWlA2TUJr?=
 =?utf-8?B?MFcwRDVZQ3VOdVNtOHVySHZ3R2MyZDRTemMrUTlLcSttTlZFVFpOVkZBNU5V?=
 =?utf-8?B?QXlKQUhpQURGL29oOFV4WWluSURQbm5KbUFTNG9DNzFadFRpSDFaSkFxVVdK?=
 =?utf-8?B?MDh1OGZDcVppRTFKcXh3L2Q1cjlhR3VOM1BEZ3RUd3ZaTWlLRFVweHRrYlQ4?=
 =?utf-8?B?QnVLSDhMRDBVNUtCRzhnd3pJK2hyVEx0SDZkNkFtaHQzb3ZRTnk1djY4UDRx?=
 =?utf-8?B?bUp4R1QvM3M4MkJQUWJadnFma3V5bjQvMmJWZTZ5ejQyZ1cybnRDdG01eFVM?=
 =?utf-8?B?VEVrVlpiY1NFS3Z4QTUyMXdsM1l1dmhBMm9IRmVoSTBLNzVZSHNKbFZhZXBB?=
 =?utf-8?B?RnRKOFBXZDA2VlpkZFMzdkZHTkEzcmZQY0tiTnpraVdheWR4M1Z5TG02aEFK?=
 =?utf-8?B?SlBDcmJMTmFGa1NLeHNNNU8zWkoyUnVkSllYRXB1b3hPZ3RGMW53U1VFdWsy?=
 =?utf-8?B?UElNVURqRnNMazdSc1g4RmxZSXJrcmU0Zko3OHkycml0bGR1T1R1WDBqWDdr?=
 =?utf-8?B?SmtmWkRzdGkwajkwTFJ5OGRNYWRWd1hHTE1CQWZqRjhHZFRRVHpJVUhidUNX?=
 =?utf-8?B?VTVZOU1HQ0lET2liWXhaUXVVcmtINW1QZ1RIU05CakF6alVXL0NJc2FsTEtQ?=
 =?utf-8?B?WE41bFRuVHphOUt0SHlBdlZLZjVjNjA4NlozdDZpcjRTcFRRU0xQYUYzQlNq?=
 =?utf-8?B?YWlhRktqQ2xMVjlJcVdudjFGTXR4RTIrOFJVWDBldm9kNkJmNFJUOUZ0NmZK?=
 =?utf-8?B?SDZFTXZHQ0QzMWpVcHloVFlGajYrYVlaNDhuU3kxdktZeS9uNzFsT1RLQWU4?=
 =?utf-8?B?QVJNRVRyU3NLOE11VktlNTJ3VEV1VWdmNE50RzhhcVNVUFllWGxHbW51WEht?=
 =?utf-8?B?d0Zya1hUSWxCWDZ4ZTlFd3g2a1R5SUF4V0ExVXo0ZDFrR0ZMZjZ1UmRLOTZo?=
 =?utf-8?B?aURhUVJQVVgyVWlYZ0cyOEs0RmxhOXkya090MHFIY0RZL1BKWGkwN3JMdlpn?=
 =?utf-8?B?algzemxYS1doUEx4cEVMY3paRVJIYnlCQVNrOUVESEhxRnpybUNtS1A0VDJx?=
 =?utf-8?B?QnNOQklyZFdLbUVLSEZHMG5pVjFMVHNjd3oyY3Q0dHBKVmVJajNpZ2RtM1RN?=
 =?utf-8?B?U1JWaml3ZUVWTm1nTEdVbzJnVm5MdzVaT3l0M0pRRXBidjJIdC9DanJEVzNx?=
 =?utf-8?B?RlhUcDkwQWJCdWl1cGN4MVlSMGdmek5xTFkzMEtuenFURHRIeHZXS0VRR2Qw?=
 =?utf-8?B?NVdtMzJIMkJneUFxQ0pPVzl6K1UxMkV1L3RSYmlHdDMrVGZOU3M5amZHeUU2?=
 =?utf-8?Q?iALeLq?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(10070799003)(1800799024)(921020)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OGRVRXh0WGM2a3hXQ2ZvYU1kNnJCbUF2MFJqc3NkRldxSDVMdWNvV3RReGsz?=
 =?utf-8?B?L0YxY3Y2RDRncnllMFo2WGVsdjBzb3drQzV3a04wTll6VzdiaTNMakJqZW5T?=
 =?utf-8?B?eDJOOEkxaFVTd2NHeUlNdDU5VGNPVE1ScTVrZXVEakF2WmJQbldLYUg1WlVm?=
 =?utf-8?B?VHFJSUNNcVV4cWNtVDJKcFprMkU3Nml4b1lvYjM2SE85Z3hJUkpqUEwxcmcx?=
 =?utf-8?B?VnhudTJyc2RKUUg2aFRpOWRsb0EyMmFCTmowTk5jMitqclRRVlNldjluOE0r?=
 =?utf-8?B?Rk9ZeTZWaWZnRmlvK25EODB3TS9HdEgxQmx5SmNIRWJINzRaRkUxTk9RaUxv?=
 =?utf-8?B?WTRrTWJhRmN0dy9tWGZKL1VCME9rQmllSXlFTTdzQ1Y3ZnpsOC9HMktTOXdr?=
 =?utf-8?B?QThrUWw4REc0dlREaWd3bmRQai9UL2NUaUpQdFJMM3BEa3c1eEJjdjZYQ0l4?=
 =?utf-8?B?N0Q4UEdVclJ6NDU4dkJNdjJqNlhNZlFsczVRRDBlSXlaUlZxVytzelhPY0xW?=
 =?utf-8?B?Tzk2ZGtsdjBaaVhYRTQ4Sk9IeW55ZktIV3BwaEJLcHhVdnNIamxUUnZ0c3hQ?=
 =?utf-8?B?YzVid3RQY3pxc1NzTjBTQmdsM1ZENmZmRUJsYVpjTWxsSWZrR3A0T3NONWUx?=
 =?utf-8?B?OGk4N3ExYTNaK0xwazZ6Qlo3V2lQa09OaFY1VEpablJKRFlBN0Y5Q0p6KzhQ?=
 =?utf-8?B?VCtqeFBTNDJwbEd5VUhzQk1TNWR0dTJkTzV4eHhmTkhLNFR6YWJ0V3k1L1VQ?=
 =?utf-8?B?elBZTzNqWUphSUcvZXdxVndZTTV1SEgrV3JMaGNOQWhYSXBQeGg4a3JqL0RT?=
 =?utf-8?B?NVBjMHJHbzkrdUxYc09YV2ZkSWUySnRyYVhaWm5NOUswaEkwTXdSbU1WVTNK?=
 =?utf-8?B?ZDlhRDQzaHlTOVhQNEtEUVdWVWI1VFMrdHBlVUhDUGRZMGpySlZyVGl1VWUv?=
 =?utf-8?B?eVU2YkpjSmxFdVdSZmV0VVMrVTlkY3BUYTRiZzJQcG1PK1lhQzVsbzVaQ1Fq?=
 =?utf-8?B?dzV0cGRxQ1hzNlZMcDVEVi9TRVZaRDNTSE02UWRWckdHQUYvQ01pT0x0cjVp?=
 =?utf-8?B?T1dFdkdJdTlyYjE0NXdEdFRtUWsxUm1Mbko5Sk1MVDR0U1F2N0crd2YvQU41?=
 =?utf-8?B?K3AwcXo1T0FNWjV1Yy9KNjVSRS9rNjVzUHFEcnpNc1pUR203cS9NbnNieFFU?=
 =?utf-8?B?MlY2djdyUzRDZVFHWTQra0RYQjBheHNjbHZqWUFKQ1BBUFhMM3pZMzNaSmM4?=
 =?utf-8?B?Y1NJWXN0RHlqd3RuMitRb3I4YzJKUVhUTTkrVWFMckZlWDY5MmFlelM4Zmt4?=
 =?utf-8?B?amFwQW11NnhqZHhiOG54SFZZcFlUOFZsVmFXUkE5TklLUlhzSWJRK0UrQlJI?=
 =?utf-8?B?SVlMQUREaTN4bkdrUjRnR2h1NXhIOCtYRDVKZTczUHhHSkdrcEo5YkttUDZ3?=
 =?utf-8?B?TDRIN1k0R3V0RnMxOThsWnhSN1NSRGdxelZrSllNQWF3d1o0SUtjZDdYVHNy?=
 =?utf-8?B?SUh6cjE3S0x6bTYyOUpaWXlkY09QNWdIUkxHUXVSSGVLVVp0aVZJVHd3RG9O?=
 =?utf-8?B?eDFsM3dlLzZZQ3c2bHRBMXR2SUUrL2k2RVlVU0txNDFEeUVGMjZpQXlHblY1?=
 =?utf-8?B?NHFWSWVUQ1ZseG9aaU1NTmFhc05NaWdXMGExZzk1ZElmU1VOMlg3TkRSenM4?=
 =?utf-8?B?emg2c1g1VnZubGFVNGRLOURUaUJEcXJPQjlFUEZVRjhsblhCQXZtN2ZiQSti?=
 =?utf-8?B?SjI4S3ZmQzkwa0drQWp0NGI3WVlNNTg3WlI5V2lYK012WWJnelVFdnZrdWVx?=
 =?utf-8?B?ekpydEJHL3Z1MU5IVG9pTUdtdlhNV0RiTjBUSjkxRlBsamlMVm9wMUpiMkJD?=
 =?utf-8?B?UWJTMkk3NFJlc3VNNlBaNEpuZDNmVGpEWUdoaGFMQzdVMW9zdTBiV0w3WUFi?=
 =?utf-8?B?WkJtQXhMZ29tYTU4MU5ncnFidTh1NWNBdHpOZUJUaHdXMUhtRnpmK1FYUWc0?=
 =?utf-8?B?eFA0TVJhczFCc2J1TDVxeGtmM3VWL1lzVDZuZU9uNDZYZVBrUEprR2hlUmNk?=
 =?utf-8?B?Z2pJNzdFbFF1SW1yMHh2SXhFTmxodUR2dlM5bC9SbzRySmhtVmpyRXRVK3Np?=
 =?utf-8?B?Rkpocm5FYlhsdmdQb0pxTzNDNWQzbklZSSt5Yks1OXo3VkR4M25ITHBOTUVR?=
 =?utf-8?B?dHNNTXQ0V0g5MHV1Y1lSdk8rQUJRTFBzSVRCRWtqdVZDV0xVczB3ZDU4ZzJn?=
 =?utf-8?B?K0h4VjhJeTdma0xqcEZyazJMK3VodGJxOXN6ZGY4a0FwSkNzdXJGQmxKWHJk?=
 =?utf-8?B?Yyszb1NINWM1aDFUZjFDVUlsZWdJTHBCalA3aEJHd2MwNGFwM013QT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ad3cdf2-7652-415d-03fe-08de51f59ea8
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 16:14:10.4482
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F6u0aSThSH8L2VeZpx5lun0NBkFCSRAsFpbBVs5dVDxc6V4S63ps1alr1cm68V7WAjqBPXZkJ6xF9LDM3jp0sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB2737

On Sun Jan 11, 2026 at 12:25 PM GMT, Benno Lossin wrote:
> Add a function to turn a `syn::Result<TokenStream>` into a
> `TokenStream`, either containing the error or the normal stream.
>
> Add a nullable custom error type wrapping `syn::Error`.
>
> Signed-off-by: Benno Lossin <lossin@kernel.org>
> ---
> Changes in v2: added this patch
> ---
>  rust/pin-init/internal/src/lib.rs | 44 +++++++++++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
>
> diff --git a/rust/pin-init/internal/src/lib.rs b/rust/pin-init/internal/s=
rc/lib.rs
> index 4c4dc639ce82..21f5e33486ce 100644
> --- a/rust/pin-init/internal/src/lib.rs
> +++ b/rust/pin-init/internal/src/lib.rs
> @@ -36,3 +36,47 @@ pub fn derive_zeroable(input: TokenStream) -> TokenStr=
eam {
>  pub fn maybe_derive_zeroable(input: TokenStream) -> TokenStream {
>      zeroable::maybe_derive(input.into()).into()
>  }
> +
> +#[expect(dead_code)]
> +fn ok_or_compile_error(res: syn::Result<proc_macro2::TokenStream>) -> To=
kenStream {
> +    match res {
> +        Ok(stream) =3D> stream,
> +        Err(error) =3D> error.into_compile_error(),
> +    }
> +    .into()
> +}
> +
> +pub(crate) struct Error(Option<syn::Error>);

I don't think it's a good idea to call a type `Error` when it could just be=
 no
error.

I think what I propose in https://lore.kernel.org/all/DFK7ITVQ97RL.2SZ2ANDI=
Q39H3@garyguo.net
is better than what's implemented here.

Best,
Gary

> +
> +impl From<syn::Error> for Error {
> +    fn from(value: syn::Error) -> Self {
> +        Self(Some(value))
> +    }
> +}
> +
> +impl Error {
> +    #[expect(dead_code)]
> +    pub(crate) fn none() -> Self {
> +        Self(None)
> +    }
> +
> +    #[expect(dead_code)]
> +    pub(crate) fn combine(&mut self, error: impl Into<Self>) {
> +        let error =3D error.into();
> +        if let Some(this) =3D self.0.as_mut() {
> +            if let Some(error) =3D error.0 {
> +                this.combine(error);
> +            }
> +        } else {
> +            self.0 =3D error.0;
> +        }
> +    }
> +}
> +
> +impl quote::ToTokens for Error {
> +    fn to_tokens(&self, tokens: &mut proc_macro2::TokenStream) {
> +        if let Some(error) =3D self.0.as_ref() {
> +            quote::ToTokens::to_tokens(&error.to_compile_error(), tokens=
);
> +        }
> +    }
> +}

