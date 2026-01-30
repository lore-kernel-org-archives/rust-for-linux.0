Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011066.outbound.protection.outlook.com [40.107.130.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D83125A9;
	Fri, 30 Jan 2026 12:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769777125; cv=fail; b=Xpbo+lBosRXUdUIchGcUsD8xEHp7D5XstniOsNjqj6gPKMQPFWQKgpqiVq9Vo87YThCBk/YDpkoz48a3Yeea3OYWSQ63642Yqk9uVXA9FMA45MyaMhF02UqscLGM+GMHa9i2YljVC65KAlAzUSEtQ4g2DQYeK4SrGyrfVIgC9WM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769777125; c=relaxed/simple;
	bh=AKUcKGt4LYhYJGdmT9fR/3IIvkYPoCN/287SqaiiaX4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=dXy+xCy9ptdlqbxB0NsrYJ8G0k5jgT0UrofIMYxwxEZbr+FhOgH5vBpqZtvCpRxnaCNV4j2MTdxb+fHxGzEANEW2Y1uyqGYbc6aPEU8+uTNb4mOwfRkSNlnnkxfigxCYldtrFtJCwJilliKzuY8LfKFFxlHoqPqpZFGAN8aR82c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com; spf=pass smtp.mailfrom=de.bosch.com; dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b=aBeuAGCQ; arc=fail smtp.client-ip=40.107.130.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="aBeuAGCQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AiqnYIrbfjN/RODvFZ6nZjhho0JOHdVvlrvbIsims6evWRUMbHj/RIOA/3PxP5KITtTXAW+9PY7pvwVF0VTdOVOCFOWOlqIoe44Nl8rhiFEO6Lf9q+mIe+LyABXHoUl1QZBZ5smVJnqLbSBZrPTXlDNmOnSiq8TgUVbHQnSzx3KVLAYLpAbNf2mtxpNpuGTU71elu4xXJTFRzb4mNDD1H3E5qANLnTPFY+L7AVrExMifIJKwZLcsEuOvysSwzDmrum0ci5CX8bVUah9vfdmNBEJJYPoBCKAzhvGQ2qrQFBUCNzCMmYCCAMvhRqWZWcRF6qtPoKOu4DMuN9z/ZodpTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Ia9yrRYEdr6OSxEvAtFX/hGkwIZsevUGoozBvPUyis=;
 b=RnPgWwYjoh1+MWTGvB8reukWoNGdxeQq7IkXlmXAjNVIaIkR3UTqMqxieSylrRQOk7S6TZaGz1M0qs+TGNPe7tps97n0QgjjuQxA8G9I6NiE6ovdRm2Hyf0ABwf1DQe1eezQcBSbUufatk+Bekv31JLffzTwMWHtEURZrVyIDwzdB9Q0ju6c01NoOqcSYa3rRgTa/YnIeZMpVGLNVJnrhMKEMp3kRYsjr3E4LxI/nARWoj9UPc+wKIVooouq94yPLT7RIGICr3o8EPz2ybNzOSBSWpy4Fo8WBUhZna0hsNgHtNa5AqUTuzDbyqkTOwdcdD0OWwOg1lALJVbxNq1fSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.205) smtp.rcpttodomain=gmail.com smtp.mailfrom=de.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=de.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Ia9yrRYEdr6OSxEvAtFX/hGkwIZsevUGoozBvPUyis=;
 b=aBeuAGCQiM7PTTCoO6QKheChN+QfHrFOpdPiZDhgGCItD/xfzUg4Q4F7EtlW/Yo6/5JKpSeFigOGUnX+VIDDNqLeSpoX7nLhjqV6XQj0s0sBRU9BGcIWwzUt0N6DBrNZ1LpSpJgF2+0pLsPhSl+7nZ+YLyY9gWsz0X5Guxl6hFILG+v+bH3Baq+GtLySQmic/icRS8cJ14kZ832kMN4Xtvpo5l7mS78JG14fQG79PGDRgYihh6OTU4IN1hQVHQmuk1x4nuzoVpJw5lEGlgni3M3KZE9Ci0FjV/7Ghfw7KoLoGC35hm6QXjYZUpCOR6PgaNG3BDZ8cHqsl3H+25PO3w==
Received: from DU7PR01CA0027.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50e::14) by VI1PR10MB3247.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:803:135::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Fri, 30 Jan
 2026 12:45:17 +0000
Received: from DU6PEPF00009528.eurprd02.prod.outlook.com
 (2603:10a6:10:50e:cafe::e8) by DU7PR01CA0027.outlook.office365.com
 (2603:10a6:10:50e::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.11 via Frontend Transport; Fri,
 30 Jan 2026 12:45:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.205)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.205 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.205; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.205) by
 DU6PEPF00009528.mail.protection.outlook.com (10.167.8.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 30 Jan 2026 12:45:15 +0000
Received: from RNGMBX3002.de.bosch.com (10.124.11.207) by eop.bosch-org.com
 (139.15.153.205) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Fri, 30 Jan
 2026 13:45:12 +0100
Received: from [10.34.219.93] (10.34.219.93) by smtp.app.bosch.com
 (10.124.11.207) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Fri, 30 Jan
 2026 13:45:12 +0100
Message-ID: <fb68b2d2-a5bd-4359-a0c5-019ef4060e7d@de.bosch.com>
Date: Fri, 30 Jan 2026 13:45:05 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH 3/3] samples: rust: remove imports available via prelude
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Gary Guo
	<gary@garyguo.net>
CC: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin
	<lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl
	<aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich
	<dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael
 J. Wysocki" <rafael@kernel.org>, Dave Ertman <david.m.ertman@intel.com>, "Ira
 Weiny" <ira.weiny@intel.com>, Leon Romanovsky <leon@kernel.org>, Arnd
 Bergmann <arnd@arndb.de>, <rust-for-linux@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20260123172007.136873-1-gary@garyguo.net>
 <20260123172007.136873-4-gary@garyguo.net>
 <CANiq72kwRdYbs9L1hrX_0SdGHsycMi9fz6+wh+qGgWiOsFZZiQ@mail.gmail.com>
Content-Language: en-GB
From: Dirk Behme <dirk.behme@de.bosch.com>
In-Reply-To: <CANiq72kwRdYbs9L1hrX_0SdGHsycMi9fz6+wh+qGgWiOsFZZiQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF00009528:EE_|VI1PR10MB3247:EE_
X-MS-Office365-Filtering-Correlation-Id: bad8df97-8c03-43fa-f01e-08de5ffd6ae6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cEIxbFZRNkV3djdmNVZXbjV6T2d0bFdic0RyZ1JBSE52TWc1MWdObU53UGVW?=
 =?utf-8?B?SFN6eWYyNlFrL3RsUXNmMUVUK1VjN3M3aUxQRmcyMjliQWFKSDVCU0xYMGNL?=
 =?utf-8?B?cDk4RTVSK2pEWnNQUU1sNzNOODBrRUJsdmpHa1NmUmgwUXI2dXo2QnRRY1pS?=
 =?utf-8?B?bjFpY05lUG03U2l1VnVMMHkwOFZVNUNDQ2RxWDI0U1VCbzQrdy9Nckd6NlUx?=
 =?utf-8?B?UUQ1aFhOTTBqZFBKRmlia0k5cE5tYkFRejhmdVFrMHVzK3VsSnBYRE5HaVg0?=
 =?utf-8?B?bzRIMS96ckNVSU45L0VPcGNta2MzQnQ5eEZJZHZKQ0tjSFA3S0xmM0tJdlBi?=
 =?utf-8?B?SE93by9UNGRscHpDNWI4L2lqZHJ4ZjlsYStEbXcxSUpsc1dnM042Umlrc2F2?=
 =?utf-8?B?Y2daUjlMWG45V25CY01VaWNHdU84MTFGOEt6Q1hDSUNITlRPNklXbWlKbHBn?=
 =?utf-8?B?V2VwVm5rYkxwVC9yUERnbEhKZnkzYWY1TlBxLzFkRmdNSk0vZDV5OFA1N0xX?=
 =?utf-8?B?enJhWjhrVlhoTWZMUW5SZGtTa05WdW5PdTdNQlZXenNwa2ZNOHFzc3I0NmJj?=
 =?utf-8?B?WFhoZ3k2ei9EMWVKQVRHeHpINXNLWjcxRjNJL2ZTOVhERjY4UnNvdlM2dEJv?=
 =?utf-8?B?dnFEVUZUVGgzbmhTVnZmcDVpalRRQytUSFNKTm4rZEdnbVdEcGtEZUJrQ2p2?=
 =?utf-8?B?Ly8zV3dLYkpFeFZIajJZQTNwYTN5c2prTHFjRmJQU0lkaEQ2U1JncWlaQnhD?=
 =?utf-8?B?MHFpSHR2SlFSZEprSlhqU3VINldEa0NtOGNTeVJWRW5EN3U4UXpiMmRkWTNO?=
 =?utf-8?B?UlR3Snp1TXJGazlDUi9oVktnandaNlNhQWZOVGRhdkk4SWRia3FHZ2x0RVdT?=
 =?utf-8?B?d1BuQ3locDQxRjI2aGRSZVBBVml2VDZDOEFjNnh5Y3graDFKY01BSmNsNXpW?=
 =?utf-8?B?UXc4UnBRNW9GeWpSOEp0cVlVQ2xZVEdzSDFJMEg4c3pxVFcyc1hSK3p0QXRw?=
 =?utf-8?B?M0lzZDdjUVp0MkY1czRrSXRRSHdVZm9ERk9zbUt0ZnB5anE2cG1OSS9tYXVQ?=
 =?utf-8?B?OXVIZE95WEJnbFRnbGM4SkZZWkdQdzhteEVCcWRYbEZuUmVPNGJQMW5GY0ps?=
 =?utf-8?B?b0MwS25oaXZVaC9DV2JDSWJ0TU4zVWllRXFNb1FEdVUxMHIzUVlIVnhTUHlk?=
 =?utf-8?B?QytDdjRsOUZZYUxvM0ZkMDdsSk5EK2d1Q2hsMUFTOTBRMkluRmo3dDdPN3lF?=
 =?utf-8?B?Vkc0OHNYTUJ1RkcwbnV1ZS9EL1NTbmE3N25KNmZEWVNWeWhGb1JPd2ZPSVNE?=
 =?utf-8?B?Tm5SWmZ3OXVyV24ya1RqTHFvNWVFZHpXclZseElCY0U3N09jUEpYS1hIZ1hp?=
 =?utf-8?B?OUtkd3IyV2pZNk5PSHU2QXBrUGVlK2lsd1ZjVTlHSEJuUCtWUlNKWFRNd0Vn?=
 =?utf-8?B?TWYwSzJuZzlCS3FaUG1QeFBhMXV1c3dTUlhQanBjRWsxbzV4T2I4QktOQnk3?=
 =?utf-8?B?RlIraFFqUEM0dExnRk5ENFZsTmVDd3J0aElmczZqUXJXWXdoNU44aXlJMG5v?=
 =?utf-8?B?NFBjamZWYzFIcDFJc2RzU0RJeGtMU2I1R2pEcnBHdDkrRzQ5MUxGL21FSUgz?=
 =?utf-8?B?WkxDYk8zV2ZQa1NRM3hOblJ1d1VpcVQ5VWhXR21CYlFLeFF3R1B5TEorTEEy?=
 =?utf-8?B?ZXB3dG1Hd0trWXRPczNLVlFjbHZ5VmRiT1JMSU9VRzF0Q1E0b3U5QTRMT3VV?=
 =?utf-8?B?anl3TjBxeXdhN3IzdnhYYjcxUll3SkJJY0VXOEpyN1lBSTdDdWlCeEZGeHRQ?=
 =?utf-8?B?YjErZ0VLTkM1WFpKenNSZnQ4ZEdNLy8zcDZFSk1wQXUwUis4V1ZIQURmcmdF?=
 =?utf-8?B?T3I0MHNDSjBJRVZnZ01sRFEvMEVJbVIxd1ZzTU15R3Jmdm5jeVZHazY5SEU5?=
 =?utf-8?B?bUdLaGg0TkhDb0JzenUvRldUMkYvTXhJT3BGK0RwNm1Yc2Q5Uk5NOGxYTHNi?=
 =?utf-8?B?WTFuYkZvV25oeGE5RnpGdmhKdERaNUpJdStaU3ZKc3h0VjVEd1BMNWVWdjZh?=
 =?utf-8?B?ODBMVUxMY3dvQnJpY05IVmVXTm1mTTVsdEdPeG5jRnIrMnpvMkFxaDZLZzQ0?=
 =?utf-8?B?YlIvVk1QTVU3T1FBeWd0MUtkVnNuL1VkVy8xZURnWTlDam9vYjhRc0pTQmxJ?=
 =?utf-8?B?TjhHcnB1YmtzVG1JZ01xMVN4S0Vra0ZnMXZqakVCRXBHT3JNL0xFVWtsQ2RZ?=
 =?utf-8?B?dC9kR1MrdnUzRTdpM2dLRHgrajlBPT0=?=
X-Forefront-Antispam-Report:
	CIP:139.15.153.205;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	jeEWLBwolAJT/x6gC+o2YKJVH2o3k3nyN+rx8d1YVPpqm1gwTsxaPnrusHLTsPQSTJYpP6P2tG5JFMl7w9xCDlb5FGwulViSxEOdOWomMCouAVuCUoO4MTTiKcGXZMuP4/1tVQiKYX9jihSYdvO1jJll6T/qIaye5NHfO5kiaqW3G4JvOxU14VxMTCvFxFMXHWD8bs61cwRC3o5ZopYU0yyIW7i4yTHZTNyCYNdcN0IpFkQgotukVsMAhGAiLzqQqjFXv8H/e3UH+IddgorGZrE/ap1G5meGtOUxR8iLtqzNmYMjh2aS/tVGvjm83aYZcW7rNm1LvXhuw7KmJNveRbONqlMz+dPfQFJGl7jsW4ntAtPVvtsZlkWcR43sG4prVKGs9rfzoH7/bdLOv5dA+5rwSvaUKYCej5dQCQSA/0Os2v/8s5hIJEreYlWmcftP
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 12:45:15.6936
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bad8df97-8c03-43fa-f01e-08de5ffd6ae6
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.205];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF00009528.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3247

On 27/01/2026 12:10, Miguel Ojeda wrote:
> On Sat, Jan 24, 2026 at 6:08 AM Gary Guo <gary@garyguo.net> wrote:
>>
>> These imports are already in scope by importing `kernel::prelude::*` and
>> does not need to be imported separately.
>>
>> Signed-off-by: Gary Guo <gary@garyguo.net>
> 
> Applied (this one only) to `rust-next` -- thanks everyone!

Having my klint setup running now (many thanks Gary!) on today's 
rust-next [1] I still get

error: this item is available via prelude
   --> samples/rust/rust_driver_auxiliary.rs:12:5
    |
12 |     error::Error,
    |     ^^^^^^^^^^^^
    |
    = help: import with `kernel::prelude::*` instead
    = note: `-D klint::not-using-prelude` implied by `-D warnings`
    = help: to override `-D warnings` add 
`#[allow(klint::not_using_prelude)]`

error: aborting due to 1 previous error

Somehow dropping this was not part of this patch. Not sure why ...

Best regards

Dirk

[1] HEAD is 08afcc38a64c ("Merge patch series "Add support for print 
exactly once"")
