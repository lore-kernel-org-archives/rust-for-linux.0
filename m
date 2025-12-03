Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010001.outbound.protection.outlook.com [40.93.198.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E0F29D287;
	Wed,  3 Dec 2025 12:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764764984; cv=fail; b=cc/4QHeKF67xo++f/dVLKJ1wlGUPUrTj6KoW+ewbygPoKDPgl/0wZVcULIZrQITWrns9R2DuP2LGvzm5zHBUzaFHsVT5cHDyJISfqAQ3tGx+nCWlJ8gB3C/D/YI2amvx3mBdv4ht/dZmDaKbGH+6N8euX27jpx34rPjnSChCQ5w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764764984; c=relaxed/simple;
	bh=7Q+wzhZvnLRpU1zYM4hNv9gKk/Y1BNo3gZHmBNn8Yqg=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=CcAc328cozZFI2HZtfcBvqQZaKw/0Lod7uz2XooAB/UhNcBmQeUauCYmC8ZL8BWBYoyXEqcoUKvcTYRiQW7NqpePPMUidFPOML2dlK4lyMkTB42UaE5Ocy1b18RTKVJzP+Y9xcM6CoqYfwwijT/YG6P/u1gsp+zxdJCD44NtWWc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=j4HKqwCF; arc=fail smtp.client-ip=40.93.198.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="j4HKqwCF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gLGjKD6GSDWLL2532bUHBdcUk3g287M1YArQuxn/wbA9CF1aA6BN3CktMt7kdZlOxtplAamNW6VVyPO5/qfAuKlMwnZ3L9L0KrvtNWHS7lj1DdU9bI2XU/4Ixrg9sndyKqxRQJlrNbLC7rL+SPgaXIQEN++J/ds0wobzCNfy7FRc72f8H9rcMoofxIVV8KrnS8l1xz3mg34u2SIUaYgzahpsoEbr+PSLBfuq7W5/G8RXVzEWIZ4MTvEA/SAu9Spl6P5ne5CipW/HgBQ8KgDOk9ZHv0Vy3rqma58RIPkgkpEIICJlzKN3UfJdEiFeT7SqG/44sj+F1I6X0m98XTSgEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Q+wzhZvnLRpU1zYM4hNv9gKk/Y1BNo3gZHmBNn8Yqg=;
 b=ZLZ3rrdkO5pKsxNIpzCt0UHL8miwKXNDeQIyXxaT+QMskIUy+eiRqPlC0m5Cs+cclWSkXrLeSajET8zIEUMvLNi2zEX8jcU54/j/QdnQ65eQKWxS4oAEjUtSTt9+sibBcQzHQMBtlEf6YFOHvzSwWByM3tOVfiLHtBsMHGImEz0PuE4b3YUN53qF2TUE4FYE+sKLECkwVxOF8vYEpYpSdpZEJMP79h233gXhhU/W2yYThZS5ggY30l96wUiyQpnLCWUGOqlqMHiReq5gL0CsFxh+kFBsc3KUX8PsrdwDdDcN8INa7MikQqozZescA1TmfwRfrJltX9SaczKFm6LJeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Q+wzhZvnLRpU1zYM4hNv9gKk/Y1BNo3gZHmBNn8Yqg=;
 b=j4HKqwCFyq/idph2g2CS9mTxYfRn4/kabVFGZLvnlYj6BIFiu/oJP71xS3Zf79joz2ODOdrt3BImjaC6Sl5h8XhBjPs3XANFhS8Jf5A+vjyEFIHNSsBPyxir8Ls/zwZeaXsP/YwDZw76gyDsEPCMr1WnVm3Z+PvWEDYrN2YWlVLkSlCQzHnWEZOhiKCY8AVJOvy8Hj5ljmM0SsHjD7GcV2UqspdCFwAcLf/YrHG0Mez4/n0IwbN5E0XvmEclrKBIZa1UAmlTVCxbLRlaIIcNv3aQ2RLAXbMXyr09ZzT1Mqe2+ybUhWkkSYp9IFy/KPo9sQDRdL2ddvdWrGu/Yc0ixw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA1PR12MB8238.namprd12.prod.outlook.com (2603:10b6:208:3f9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 12:29:40 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 12:29:40 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 03 Dec 2025 21:29:36 +0900
Message-Id: <DEOKZ255N1YJ.1U9OX5KDWQGY2@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Hsiu Che Yu" <yu.whisper.personal@gmail.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Yury Norov" <yury.norov@gmail.com>,
 "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v2] rust: num: bounded: mark __new as unsafe
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251202032541.78497-1-yu.whisper.personal@gmail.com>
In-Reply-To: <20251202032541.78497-1-yu.whisper.personal@gmail.com>
X-ClientProxiedBy: TY4PR01CA0116.jpnprd01.prod.outlook.com
 (2603:1096:405:379::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA1PR12MB8238:EE_
X-MS-Office365-Filtering-Correlation-Id: 38db6dce-f3e2-472e-349b-08de3267a100
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|10070799003|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cFMrS29nSVJ2SlB1U2VuU2ZyYjdzYkdQdkJDWllVcVZzNWxHbE5HZFF1TXN4?=
 =?utf-8?B?R05SamRKYU1LbHlCMXJ4Ni9xcDdWYjdUM252MStGVjVIYTZyZnVQSCtmZWtx?=
 =?utf-8?B?ZEw0U1I3aHFyeWlmU2F5b2tsNEphMk4wV3FLR0Y3R2pwQjJNdkJEVFhtWWha?=
 =?utf-8?B?VEpINjFybzlZNlhFTEFvWXlGUTdQdkxFeDFBMTNYUklDK3pyS0JwUGF2ck1j?=
 =?utf-8?B?L2YxU2diamtSU3psWFJnQTdjck5IQUFSSHpleUtpcDNkNFZlRWFxKzlHWmJk?=
 =?utf-8?B?UXVDRndnaU5EOHZiYTFlYi9KNzAzTkI3YzN3VEdtWHFGYUtHd1paeGlzeWp6?=
 =?utf-8?B?QjhZT3BUd3diZ1lDK1F6L20zaW9jdk1MWFh1azRvSUVmNGRJZEJyeCtkTVdF?=
 =?utf-8?B?N2ZxclFpQUJCMGxwS1dRWU9UVTJlb2VpNDhsWWtEeGNKN1NYaXFSbWMyYnFJ?=
 =?utf-8?B?b0NlVHo5b1NoQ2VXYW1lZGQ3L1VmMW04S3JrMEFjZ29OdjlPMHdMN3N3dFBu?=
 =?utf-8?B?cklucTR3U3dJbExZOWhNTFd2dDFVN2Jhb3hSb2tjSUhrSHhmeVBUV2hWc1h6?=
 =?utf-8?B?UXRQaW5QcnZZd1ZHcmJ3RUtEdC9NbkhOSE9aazJ1bHFTZmhLWEZlTGJ6aFBK?=
 =?utf-8?B?djNFY1Y2UUhFUUt1Nm15TllLdGdYR0lxUkxpUk9RWE85cmZOWVd5TFduMDBS?=
 =?utf-8?B?ZEFidlZlTmpWUk5zK0d1OVlobGNuaDlOUFF6UEQrcDVoYzlhQ0Y2TCttRG5a?=
 =?utf-8?B?aEVaZmRSbVFETENkNzAweXMxNVZabjFHM2ZKRGlKZ0ZDekU3bW5zcmZ4bmFH?=
 =?utf-8?B?OHNVTmNsd01yTW8reWRqRzNja3p6UytDN2hkaGRSMlZ2WS8wekp1SEEyMEs1?=
 =?utf-8?B?VXFhVVNtcXhLZ1ZuMEVqSUJYbDNVUEpPNE5Gdk9BWXZwK2ZzZmU4UXVYRkZa?=
 =?utf-8?B?MXBmVUN6M2ZLZmYxNWNTN0Q2V3UxV3FqMk5UL0t1NU5WdE1JK1psdFU3dnRB?=
 =?utf-8?B?RFVIdXdRWllwUWtoS0pmRSt0c094WlB2aEkwTWxzZUkxT0pEUm9XM01qNFhn?=
 =?utf-8?B?b3pYOG1qc2JrSzE0WmVPUHdOZTBGZVM5THNXTnlWNW5FZ1FsU1BXdTVKYXQ4?=
 =?utf-8?B?UzI0cGJXUnAvb2szZHFrd2lTS3hmQ0FTSUZCY2pCQnBsaEdtWDlyMGk3bE83?=
 =?utf-8?B?UXoxaTVySU1QRVRRRWJheVNGZ2FadTVuWFIrRWRHelVWYUJxMkVQMXcwc05I?=
 =?utf-8?B?Uml3d1p0eDd1YWtvdVBNOEFRR3RHR3ZXS2VtVjVMSUJPbG9Td09CRDJsTlRN?=
 =?utf-8?B?ZnlpdnRPOWRrd24rdXlYMkw3MnhEN05Odkppem9wTm1uL0hSWWtGai8wQkVF?=
 =?utf-8?B?UjZVdFhuNHVuUEJDRmF1bUhNZTBsQUNjbkxyZWFOaEtRUUVwbi9OUDA4TE8x?=
 =?utf-8?B?U3hIS1VvbjRSTC90QW9aekhlS3laRy94dlFEU055QTkvelJEWVZwbWIvaGRp?=
 =?utf-8?B?cXJEOWx6OHRWNlhqU0ZrUndhRGd0eUdGd0VoZWhvK2NmcHhtQTRUU0lRL0U0?=
 =?utf-8?B?V0luN0VSZ0xYRnlWZFcxRGlYMm9uQXBpeVYrMUZwL1hOdTg3aFF4Vkd1Z2x6?=
 =?utf-8?B?dXlvR1ZNQUtwQWxpcEFQOFdSNzNMd1g5NlBVY1AzUEdGb2JZVC8rWGNWK21D?=
 =?utf-8?B?cmovSG1yU3NmVmtWZStpT3pRZkIzOFRPMFFIYzNySVhXK0F6RUhDMktDbVQr?=
 =?utf-8?B?NUxEbFA1ZUgyQkR4dmorYnBhTjVwRXZIaDQ3V0FJQWZyUzV5aDZZMUZiTG9j?=
 =?utf-8?B?SS9FejBSNmFLZkFFYTNESHVXWXJjdmZZTUh4Z3V6ak9WVU81b2FMZU44WkpG?=
 =?utf-8?B?d3hveFRrSVpid1ZvY2xLSDZMSEVxNi9IbHBSZzE0ODAwdFJsQkprSElpbzRV?=
 =?utf-8?B?eDFKUlEySzl2WXVtL0lEUldYd1NQcXoxWFBZQ3Y3VVJscUVOQktVZnJ2TlhY?=
 =?utf-8?B?ZGhWYkY1SkZRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(10070799003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TlUySEd2dnZhUnE0YVNmSHBIbVlRSUJjcDBHSUZDRVBCYXlYQmI1ZDQyMVpJ?=
 =?utf-8?B?QU02RlpXakw2TWY3a3l1QXArcEpORFZKdHFWc2IyNDduNm53WEFoT3l1UFEw?=
 =?utf-8?B?WlAyZnlGWVFaSWx5OVFEOFpWd29VUVRsb2ZBN2NPenpzb2RaTkJ6TFYrRkt2?=
 =?utf-8?B?WjdMNGsvV2R4RXVQZVB0N2x1TDd6NkloeEx6bHNwUXcxM3g0Qm13Z3JQWHA1?=
 =?utf-8?B?R0dMeUY5UTllM2hGTGVhWGQ1d0dHRW9PVlFrTG4xMnVwRjZqNTJsNTZTdzU2?=
 =?utf-8?B?TTg1bUZVb3IreXVORXdXYjNOOFF3OGhYL0Y1NlB5Qm5nc055VGJXOGlSaVZC?=
 =?utf-8?B?Z0E2TGZlWGNHeGtZbHRrZEE5QWREV0NOSWZIY283MW1xdW9GNVZLTExtN0tC?=
 =?utf-8?B?WmxKbjhiTm5uY2pKWXhRVVh3MUlWREpWNHIyZ0paT2hISkEvYUhxMi9QSU9X?=
 =?utf-8?B?T21vRFpwbXB1aGg5aWFVeEhmenZ6Rk1aWWJRQjVwckFKQmZSZm1BRzZZZ3lv?=
 =?utf-8?B?V0hLRTFrVnFpS3hiTSttdXBSV1FtamRuTld5UVVjRExON09ZdzdLbVFucHhG?=
 =?utf-8?B?L2xld1lqakN6anl1VkNaend2eTBwck1JcGs3ekpaMFFKWWNNNmw4VTUxMUI3?=
 =?utf-8?B?QmFFU0xFSnBKemdGaWNzNzVjMlNQQnpmMFVyaEVyK2NHTjVSdTNYcThYdm5s?=
 =?utf-8?B?VmEvWFhtVFduczBLek1wbzZlT3g2SnJxZ2wxY0oyTmRTemdvODA1OU1aNzBl?=
 =?utf-8?B?dU44RUp4Y2s1WTAzY1R5aDd4OGVZb0tvNUd3MDJIdzMwNGVHOGRaS3U5ckds?=
 =?utf-8?B?MjNzTDFsSkloRlRuMzFGRDhGTFpTeUlaMjVCeTFkL3VBL1BjRmppeHozZkpI?=
 =?utf-8?B?dVQ3Ulp5VW1SMEVBVnZLSUd3M0xxSS8xejN6cXhZbGZiVXNBM2Q1clYwejBx?=
 =?utf-8?B?ZUF2T2R0aElsUDNwbWVOdGtwckFTQU04SDRFTFgyS0ZxeW5xVWZRUTVVRlRE?=
 =?utf-8?B?RnV3VTlnUlJkN0F4SGRPZlJJVWNINnFtQzljR21Edy9TaGNsdzUzQm1ld2NJ?=
 =?utf-8?B?ZGZXK2tvQ3VzM2pGQnNvb2lhM2h0SEdkUVNQT2lzblp1SkU3TlI0ajR0Z2Vi?=
 =?utf-8?B?b0FBZm1wc1JHN2hRMGhQZkZ5OGlXUTQrNU5Dc1RzV3hNZFB2R3drRjRaZE1J?=
 =?utf-8?B?bU5WbFllL2Y0azNCZ3VZakJhRFRNVzlXNkF5TVM1OWdpOXJFRXI0N2RUQzlq?=
 =?utf-8?B?b0FWb3RZMlFSblpnSDA5UTkrRFB2MlEwOXU2MnUyM0QvYUdzY0ZpTFdWcW9Q?=
 =?utf-8?B?c2hZakxVR0YwK3pUZFRtckNsamloSDVZRmE3dE00WE5YbDh4cUNuV1BqYXlO?=
 =?utf-8?B?b0dPZTRUMThTczhDTkFhV3g0VCtlQVVwMEw3QXo1Si96bTVub01yM1cvS1lE?=
 =?utf-8?B?ZFd2RURjUGVXMUtnaDI2cFFKUVhDQk9VYUVPaHNnUm5DaDAvc0VoTjNuLzly?=
 =?utf-8?B?T2FxbDB0VzlaQXVJcmZNajF0L2Z5dldXZ3dzdmRpS2Z0UFlzNjlzcnIreDd5?=
 =?utf-8?B?WXcyV05QTUtYVjNWMDNVRURBaXFod1MzcSt5N1JGVzRTTXhmN21hWWVzT0RX?=
 =?utf-8?B?WlJjbTNDc3NQd1pjTnZLdUJKcGkzdWNGNW5QWk9oZEFlWHI5clZXTXljYTZv?=
 =?utf-8?B?THVhZ0xSWkVBRWx4b3Z6M1hWb1VCUHNDYiszMmNKYm5WSFVWajl0ZUN5NWlP?=
 =?utf-8?B?KzkwUWpFU3YzSkl4WWhDb1M0K1AwbEs1WjloL1k0Ym5VblJjTERBOHNsSHVO?=
 =?utf-8?B?c3B4TzB0N1ZrM3cxbVVxZ0poSFB0clBVdlRDMzcrQ2xYTHVIeVJmejRwL2lL?=
 =?utf-8?B?eDJBWE5TQWxYYVpEUHZ2eHdmKy9FVy9tVlZ2bS9TNlg5ODBCOTdQaTdpcDgv?=
 =?utf-8?B?cHFxR2dVK2VLa2wvekNyRVp6dGM4cUhweS95OE1Qb1FzL2RiYlcwSDBhNmxJ?=
 =?utf-8?B?WGNMUUlWSGhHU2tsODlwOHY1MHJZZk15T2FrTldTVkVGbmF6Sy9RRUV2dkhu?=
 =?utf-8?B?YUZLZm4zbnVxaEZxaGYvYkE1MXIxSWhTcXVnQjdwL2pmb09RcUkySjFtc1lo?=
 =?utf-8?B?N29VRXlOWEZnWU1OUkdtalFPeC9YK01zVFlYbTc3djdld1pWRE5renBLN1pX?=
 =?utf-8?Q?Js48Crs4IM0t5VkWcmj3wW3cWS8AGjXk2lWZXD1QIe4y?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38db6dce-f3e2-472e-349b-08de3267a100
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 12:29:39.9037
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sPhPslSSmsFNuJ0Vxt58bbZDY+AnmZ7WeiUVTRi8X0fzWPFQbUCu7k5dcMdAUJ+n8YZsck4Gh/PHHfEOvhs3Zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8238

On Tue Dec 2, 2025 at 12:25 PM JST, Hsiu Che Yu wrote:
> The `Bounded::__new()` constructor relies on the caller to ensure the
> value can be represented within N bits. Failing to uphold this
> requirement breaks the type invariant. Mark it as unsafe and document
> this requirement in a Safety section to make the contract explicit.
>
> Update all call sites to use unsafe blocks and change their comments
> from `INVARIANT:` to `SAFETY:`, as they are now justifying unsafe
> operations rather than establishing type invariants.
>
> Fixes: 01e345e82ec3a ("rust: num: add Bounded integer wrapping type")
> Reported-by: Miguel Ojeda <ojeda@kernel.org>

Wasn't it Alice who said that `__new` should be unsafe?

Although Miguel did create the bug. In any case, maybe add a `Link:` tag
to this:

https://lore.kernel.org/all/aS1qC_ol2XEpZ44b@google.com/

> Closes: https://github.com/Rust-for-Linux/linux/issues/1211
>
> Signed-off-by: Hsiu Che Yu <yu.whisper.personal@gmail.com>

The empty line is not needed.

With this,

Acked-by: Alexandre Courbot <acourbot@nvidia.com>
