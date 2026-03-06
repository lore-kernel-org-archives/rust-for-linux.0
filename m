Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021091.outbound.protection.outlook.com [52.101.100.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C7D341AB6;
	Fri,  6 Mar 2026 15:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.91
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772811338; cv=fail; b=QqW/Sg1hxxqTwuNYpWhEgtqgPE0YwvmkTWeQDGCEsd2uByGgy+yts+j0S4PkhTY891L9P8GOb/J6Y2okCd5HinnLumUn2X5CfIH3k/7QEj8uL8I77hL+/mjh6uf2AReFnASwqZm6C8f2Q7jBstjlLhlIA125Xn2LqD4bpkXQ+nE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772811338; c=relaxed/simple;
	bh=gzPJ+Tx4r11ta2ewnwqcSdhGjCUrK4ReZtlu2Qi4l4c=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=CYtYPCtg16cyIeCehEAb/b4XExymXzcnJZfRgLFVQ+1vksHN687FB81jCrNwRA7WqHBIzeyxy40WLiMD3s6IcKHTG75ES8RDO0eA7WsmEAsjvrNfJzxa3WmANNZJ6FFiu5cTyrtJD2E5iSrCN3M0I4LRmgAMxwZt1uAEW1NsLdI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=h+8gb9R2; arc=fail smtp.client-ip=52.101.100.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="h+8gb9R2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v5dexDEzuAzHp7A4agV0X5sYJERJPUAnuHl/t922Mf2IGDs8DyE1+FBm1g3IgvsUjOdWoGHH8uVt3wmZrO1wjok6cZhaMrUs5zf9lgfQvXERksxk2s01gdqEKhbEASd8ZvoJ0LWhUUmaDjdwDn3IbaK04fJPcFNsxn3smZSMZIGyjrZRCqvd48SP4iWuEP/7jXEFUDBB+aC3kBZxcNZpyhCj2qTg1FCoSQphOApU8BrSFoAjEIGZgPylD3nrMzjDyUTGnpD/VEQ4TZq32ooCRQ7qq/dHvxaGb9hCvX0VakLvOWaPeQ2tVxNV0bnMeQoQAT1sLW4D6JxWoOgRAiC1IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WGJiAcTbHE/s9QfK+3UyEt2OQxKJv4BAaxlz8HjwF9s=;
 b=yH4l99igUXoT+CgTTbYZTlg3bGSFwYMYtyVG0c5ZW4reWj9JNjNx013R0+y/taeRiUtayaQm5HvvwEymC8iVqs7EmqppTB+MyxFppWU9TA1MOEnMJrhV89HsMPJ+BL6XePYTKzxBZtPrD8OE3iu3HlpvNy5IXQt+tDvzkVTLZfBMRxJLt1Pd5llSJysSy0fLLsXfLeacs0AQzfhslHAvaFjJrEuLaggeO2LNGsSc0TC61UW6yGvk1g5t9Q9Tv91fbIKiLLdIdHL7KsWcTNPn6RCw+qLqekRZ8ayrWnc5H1Hb8V5aFk9rTR0rTtScYYq1nH4/xVY3vTHZFwBTHJBeQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WGJiAcTbHE/s9QfK+3UyEt2OQxKJv4BAaxlz8HjwF9s=;
 b=h+8gb9R21x4Qu2rs5uL2xakB1K1sv4EDigGCJChQpnkfKp4AsM3gIXfgUDOve0/uZcpPWCJUCAV3CUCnTq5DcmAJ/eF7l1Vu8SimvwoE0uwto4/KUUO+XjO53hLYaE4m1WDYuFV9jjrvjVeOX5QF1NRW3z8B7CFvr6hi22iKSmc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO0P265MB6678.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:30b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.19; Fri, 6 Mar
 2026 15:35:33 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 15:35:33 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Mar 2026 15:35:32 +0000
Message-Id: <DGVT62XLP0MZ.YVAQQ5APE9S6@garyguo.net>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 "Miguel Ojeda" <ojeda@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Boqun Feng" <boqun@kernel.org>, "Yury Norov" <yury.norov@gmail.com>, "John
 Hubbard" <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Edwin Peer" <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 "Dirk Behme" <dirk.behme@de.bosch.com>, "Steven Price"
 <steven.price@arm.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 05/10] rust: io: add IoLoc and IoWrite types
From: "Gary Guo" <gary@garyguo.net>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260224-register-v7-0-aad44f760f33@nvidia.com>
 <20260224-register-v7-5-aad44f760f33@nvidia.com>
 <DGPXX0NEGDZ4.1PKJR9IWL2FS3@garyguo.net>
 <DGQ67S1NH3OA.2MS0YVO0UU2E2@nvidia.com>
 <DGRJJA3068FV.3CE7J7SKLTN8O@garyguo.net>
 <DGRWZVJNLLH0.39JYHZIIMC9XK@nvidia.com>
 <DGSB81ZE18O1.31CVVHMP38U2W@garyguo.net>
 <DGSBMKY53C5T.3BRV3QI7KOZTL@kernel.org>
 <DGSC6U50TCHF.9FKDO3AWL3Y1@garyguo.net>
 <DGSZWZCI0H7H.2EM8L04YH0YRP@nvidia.com>
 <DGT09KTYDCU8.3BBAZBGIYRGWV@nvidia.com>
 <DGT8FQ97BL8O.1VC1JEXIEBDRA@nvidia.com>
 <DGU4TLDMLFN8.1KKSL2WATFZ7G@kernel.org>
 <DGU7U81KKLCD.2LEPJ73BGLQU@garyguo.net>
 <DGU88IHVRYHD.9WP9Z40UAN37@garyguo.net>
 <DGU92W2W71JI.HBIFK6L78F9C@kernel.org>
 <DGU9AZ43QK6Y.115RDSK0M9JY5@garyguo.net>
 <DGUAC0GJRR0Q.34WBS7BIZ58WF@kernel.org>
 <DGUB44J4FNCA.32QOV1DYI7VBK@garyguo.net>
 <DGUBN1HP1F8I.2RZGSFCBO9FQS@kernel.org>
 <DGUCFC9NJG5B.Z7YUXK4NEE04@garyguo.net>
 <DGVGGGBSC9PI.1TJV2ZAIML0BI@nvidia.com>
 <DGVMXCZGEWV9.41R0TPTD22S1@garyguo.net>
 <DGVNJ8ANGP3Q.1RAGWU2HJGRIB@nvidia.com>
 <DGVO2O009306.GNU06PZ13VA6@garyguo.net>
 <DGVPNC2HE0JB.1HOBJZX8L8XMQ@nvidia.com>
 <DGVQAUVL2SZZ.2TINCJXUIDTCK@garyguo.net>
 <DGVRU6S7WUIU.1OL2CZU2ZUIUO@nvidia.com>
In-Reply-To: <DGVRU6S7WUIU.1OL2CZU2ZUIUO@nvidia.com>
X-ClientProxiedBy: LO4P123CA0328.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::9) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO0P265MB6678:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c9de9ce-0df3-4336-20ee-08de7b960134
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|376014|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info:
	97bkLZh8bZnyL3CpdHAFeovBK1SGMj7BuCE7ZnabANb7NPN++QcU0hShrdJ9qqaCypYs72QVnGH4/jUQtr9R4UuQ6Z7J+/6t/ms9/VYwHQVpyvqaHRUE6s+5Z1xtpRUxWXwS5fP8WDbowXyAUJ7FLypOQHvgj6dY2kkdjHrrkF318a8BgW1UEeGBG5sfnpLuJnvLF5RFuFX9Cw16RO/YawSdjtWpzFK4ExIVoG/RGHfpl85ok6aHLWY++CpndVkSNtiuvgvxe7645Juqf1eat2okqHBPLw7Z5xCkCmsN8gzsQc85kOOxuMw+RWLWJWY3//+4DgqMWVswhOqxycAoffy6JZGSaFMsS3KKm1Ab6qyWgNwbz2KXEXlBCfgh/RvMJN54at81j7ZCwaUtCjePxHCDnr+kMa9J+kI282vJxvyF1XIPLRO7XJ1pWOBVpHM/IKX/TlmtOyyiZyENJ3Xr/o6Qfr+6qkSAq37fBpsK8M4LTKv9E6WMxoixBBmhfsg96AEgRDhdE+Mo0NtT6MIevi8Paxn7CL2DCtcz0TfII/XuD0t8tVd8gfLA0PhQGG6qopourl1Q2gXySTmhAzFF6hiruta8tguzm4Sf1uoBmAb7Apdd5bg8Kg4TultEKB7WUJKI+pjwE8bd2gs9XHaeR0iCLGaxRK7kCwleOMxacFFbb0Hcx9CY51Su5224r1wkmGlJnoJVwpzQp7SWtTeJSP+9kKkw5MIYygYeY34F1/w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024)(10070799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?blA3UjdhWDllbkN4WlBOVjJ0ek1lVUZ6NzlyU2FLc0JvTzl1c0M2UnE1YjM1?=
 =?utf-8?B?eUVpSWZtN1V2SytuYnpzOFJ5eGo0VXFSVnRFMDdMSGExcVhTNWpCelN6bHdT?=
 =?utf-8?B?TlBKWXF6Z21ESHlXbGJwWDFqSUhLYk5vMmdOSm1xUmpUNVRUdkcrNkVIMENr?=
 =?utf-8?B?akN5Q0dVSVpMdzhySlExcUNPWUtKREQvS2tlTHlRSndKb3FJN05pN2hCZzJ4?=
 =?utf-8?B?TUlFdzlLdzVRREZwdUpXLzBXaTAxQmV5c0JkUUdRSk9KVDQrVHhvVkQ5L1dt?=
 =?utf-8?B?M056UmwrM0JQb1dQdmN0UWRrN3I5RGpabjh6QW5oSllhOEVtYkNPTWpNLzAw?=
 =?utf-8?B?Q2Fzb2o2MTZVcnNjVGxnUU1KMEMzWTZwS0d3MTRSVWNMeWcwTGFncllVYmEw?=
 =?utf-8?B?SlVpbUVJZ0ExaVFnQ09NNklzREJoVVFNbzdvbEhMVXhHNTdKekErazJoYVRy?=
 =?utf-8?B?OWhjd1h4ekJHcUJvUTVMYjUvT3l0VWhQRVVZSWpYdjgxZFBxUHU1aG00aUZO?=
 =?utf-8?B?MVJLUlo4bmNZK0o3YWZxWWE5SXJablVjUGh5K3BSS3M4clMzTHJHdnBuMk9m?=
 =?utf-8?B?anFhZExnam95WTFrbVAxWmJBaUpSRGxlZmlYODlTbExMNk9PNHZ6MndLQ3FW?=
 =?utf-8?B?bWtZSkg5TUJtZDlzd2VpOXdiZlJvRFRWZUtLN0dSdEw1R3RKRmt1MkM1LzMw?=
 =?utf-8?B?SVBHOXNKUWYzQmhHdU5pY2Fjdml0a0NBa2hkeDc4eXpHL3lYNFBjWkZmSzNV?=
 =?utf-8?B?RTlnQllyaFhaeEFVR01vQmIvck1lWkpicTJzQ1VON0hqSlhqZXZvL3kwV01k?=
 =?utf-8?B?SVd6eXRKeVhKM3gzQUhINkxsbWFwMWd2MGxwclN4U21QWm1IZUhvd0k5VnIy?=
 =?utf-8?B?aXRWa1V6U3VTMkoxRFJxSzZRcDM3SGFXSTkxcVFEZmNoSkcyTEY1dWJEWjRs?=
 =?utf-8?B?NGlKa3IxeFpxNlFJOWF5RWtyLzJwQkFCNzZuZUoydG9RZENpOTdrQ0htaXEx?=
 =?utf-8?B?RUlyQU9yVDFDMytFMWxiYUtxRnc3ZDJNUSszYlVURlJmZ0hjTTkzWkU3b0ZV?=
 =?utf-8?B?N1dtdVpheng0c2JDNkdVUThOZkNuZHRCTFYwZkI1RGV4dWVpbzZIRGFHcFUw?=
 =?utf-8?B?L1RwZjQ5QjRiSGRsYyt3M1dvSVZ4SHpLS1Z1cDRYU3hka3hUVTI0MXR5Wk5G?=
 =?utf-8?B?MzNQS1RtNng2cHVOREJyZVg0Qmt2V1BqTk9tNVpiRnRReG1HQlI4SU4vbXJs?=
 =?utf-8?B?RVN3WXNLNGlXTnJrT01KSlZ0YStnODN1ZFZHREhTVHZyT2lxaG1Yc1NHaERG?=
 =?utf-8?B?Zk0wWHRaWXNLcks0NForZ2VYZlRySWxtT0tDeVhVU2VNNkFwWTkvVHhRSGZC?=
 =?utf-8?B?N2lPNmRxR243Y3d0T2krekJRYjBWaFlUQld2a05JbnZ1NzNtNUd0RUE3K0Q1?=
 =?utf-8?B?WVBJQzZxZjV1K0tEdkQ5NmdJd1I0WlI1Q1RsMll6ejVsSUl0YUg4V3B0UXBz?=
 =?utf-8?B?dm9RN1N6ditBYkppMzJGeEE5Q2RpQ2Rrd0FPWTYzV2tuZGVsZ1hoNDR1SmhG?=
 =?utf-8?B?SU9WZkdXMVNwbmZ0bVRRekdPZ2dmUXRsamFQbzllZ1lOdllQdzJQQXp4RCtL?=
 =?utf-8?B?RStRL0V4L2xlR1JzRzRMb0E0STduRUd5SGtrLzJLYjZhT2xHZ3Nod3NwN2Ru?=
 =?utf-8?B?MmxDT3ByTjV6aVVySEJUSEl4TGFIWW5IcE42SDhPdUljUkMrTEhGZEJ0VzFU?=
 =?utf-8?B?VDlhdDZKOWpndlREd0owR29pMVNxSmlFMWtoZGJvTHl2WkU3cEpnanlXOHFl?=
 =?utf-8?B?cnJORVhGampuV3ZJM1F0ekg0YnRHcGRzTXEyMkdNSmlFZmdaT1FGZEduWSti?=
 =?utf-8?B?U2xDdjZrdDhwRHhjOFdONmhMUk4vbjgxczQ3MFlUeDFZNGF6TW9lL0oydm1q?=
 =?utf-8?B?YkNoTTVEL1BTZ3NrR0p4b2F1dmREbkVGRTF4MkZsdWtaSE1XZDg1Vkt3R2Fz?=
 =?utf-8?B?cTMzTlVOSXhKWEQ3UWlMYkZsc3plOWtSN3NzOXEwSk5rNXVRQzQ1TDdBVE8w?=
 =?utf-8?B?T3FCb3hTZzdXSzhWN3hQWXZKcUlzMG5kdTFuVG1aWFl1K0IveDdPeVlZRFlp?=
 =?utf-8?B?UkpQQ284amV3TUUvN3VZMzJTR1BQSlFBeEtndWFJdGJuZlBTN252QkxIL1ZD?=
 =?utf-8?B?Y3NwVElXTEZjc1poWlpnOVBwelprbVlKMUFTVmErWWIxY2VyYnJMZkZSSTUw?=
 =?utf-8?B?dysycW1tREEwM3ZmWE4vNFFxWjBqTDVjcVFPUEsxQWZndkhiRjQ4bWZnU1FG?=
 =?utf-8?B?ZTFNRXBCNk9zTjZTcitpazZiZEJOaGRFVko2ZTVqSXNka2xuZjNXUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c9de9ce-0df3-4336-20ee-08de7b960134
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 15:35:32.9571
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WmT3/DyHYUEKahqLnnN6N2RD/GAxgoz+LT+NUa9AbVjRALLnaJopX1e6La93Dh8oraIkPaM0nlpYCYcncpSTTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB6678

On Fri Mar 6, 2026 at 2:32 PM GMT, Alexandre Courbot wrote:
> On Fri Mar 6, 2026 at 10:20 PM JST, Gary Guo wrote:
>> I  mean not sure `at` gives me that impression at all. It would just let=
 me know
>> that I am accessing it at a different location. If you omit the `MyRegAr=
ray`
>> part then there's no real indication that this is an array to me.
>
> `at` is a function name, we can change it - I picked it because it is
> short and reasonably descriptive. The point being: we have a unique
> function that indicates unambigously that we are using a location for
> an array of registers.

Okay, maybe `at` is not the biggest issue. I just instinctively feel the us=
age
example being awkward.

Perhaps the fact that `Reg` exist itself is awkward to me. It looks like a =
type
that exists only for things to typecheck, and not itself represent a meanin=
gful
concept.

>
> You seem to reject this design because the syntax isn't obvious and
> natural to you at first read. We are trying to build something new, so
> of course if will look a bit alien at the first encounter. That's why we
> have documentation, and I think it is not very difficult to wrap your
> head around it after seeing a few examples.
>
>>
>> If `at` is only for array, how would you represent the case where the sa=
me type
>> is being used in multiple registers?
>
> That's not something that is supported by the register macro currently
> (probably not a big change, but not something I will do in this series).
>
> But to try and answer your question, such register types would not have
> an `IoLoc` implementation of their own and would need to have their
> location constructed explicitly. In accordance, the construction of
> their value would not bear any location information; thus there would be
> no redundancy.
>
> We do have a case that is pretty close to this with relative registers.
> These are accessed like this (real examples):
>
>     bar.write(Reg::of::<Gsp>(regs::NV_PFALCON_FALCON_DMACTL::zeroed()));
>
> and
>
>     bar.write(Reg::of::<Sec2>(regs::NV_PFALCON_FALCON_DMACTL::zeroed()));

Relative registers are something that on my list to eliminate and replace w=
ith
projections, so I don't particular care about how it looks like.

>
> But for register types that can be used at several arbitrary locations,
> I think this would be even simpler. The different locations would just
> need to implement `IoLoc<T>`, where `T` is the shared register type.
> Then, considering that the two-arguments version is called `write_at`,
> you can simply do:
>
>    bar.write_at(REG_LOCATION, reg_value);

Having `write_at` as the name of the two-argument version is okay to me.

>
> ... but this design also makes this possible:
>
>    bar.write((REG_LOCATION, reg_value));

I considered about this, but IMO this looks awkward.

>
> Tuples of (location, value) do implement `IoLoc` themselves, so we can
> use this little trick to support a 2-arguments syntax with a single
> method.
>
>>
>>>
>>>>
>>>> If you want to make things more explicit you could also have
>>>> `bar.write(at_array(10), ...)` or something similar.
>>>
>>> Is it possible to generate an `IoLoc<T>` without having `T` mentioned
>>> anywhere in the call to `at_array`?
>>
>> Exactly same as the `impl IoLoc<REG> for usize`:
>>
>>     struct AtArray(usize);
>>
>>     impl IoLoc<REG> for AtArray {
>>         ...
>>     }
>
> Right, but can the correct `REG` be inferred when the call to `at_array`
> doesn't bear that information? The type inferred by the second argument
> would have to be propagated to the first. Guess I'll try and see.

RE: inference and bounds checking issue that you mentioned in another email=
, I
think you can have

    fn at_array(i: usize) -> Result<AtArray<T>> { .. }

and=20

    impl IoReg<REG> for AtArray<REG> {}

The type inference here is no different to `Reg::at`.

>
>>
>>>
>>>>
>>>> For the array case I really think trying to shove everything into a si=
ngle
>>>> argument is a footgun. The type of value in this case *doesn't* tell u=
s the
>>>> location, and the location needs to be explicit.
>>>
>>>     bar.write(Reg::at(10, regs::MyRegArray::foo()))
>>>
>>> "write the constructed value at the 10th position of the `MyRegArray`
>>> register array"
>>>
>>> What is missing here?
>>
>> This is completely un-natural if I try to read it with fresh mind (try t=
o forget
>> about implementation details for a second).
>
> That's what documentation is for. Please give it a fair chance and ask
> yourself: would it still look unnatural after working with it for
> 20 minutes?
>
>>
>> `MyRegArray` here is a type name that is a bitfield and not an array. `f=
oo` returns a
>> single value and not an array. "at" here is saying that the register is =
at a
>> specific location and doesn't really indicate the array nature.
>>
>> This is why I insist that I would prefer an explicit location
>>
>>     bar.write(REG_ARRAY.at(10), Reg::foo())
>>
>> would have no ambiguity whatsoever about user's intent.
>
> IIUC `REG_ARRAY` would be a const ZST and `at` a method returning an
> `AtArray(usize)`? I still have doubts that its generic type could be
> inferred automatically but it's worth giving it a go.
>
> If that works, then I assume fixed register writes would look like
>
>     bar.write(FIXED, Reg::foo());
>
> Unless we have a specialized `write` variant for them.

That, or `()` as I mentioned.

Best,
Gary

