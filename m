Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022079.outbound.protection.outlook.com [52.101.101.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF2033446C6;
	Fri,  6 Mar 2026 10:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772793728; cv=fail; b=OWhfEBGMrK27l+UujOEMLtB6/hqIn37Hr7Fq8AizP4kgOMYrbLKBpHBBRnuYx2Xl4VoBpp9tvwdldWMdOR3ZN4WE5dpZu1BH7UuF9DhSZSVQ/TiTJbX2+Q+6QbuqZT6jbAVFjeQXjLD8M/YeqZTKnRSEKc+v8aVdZDl7f9CE+Q0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772793728; c=relaxed/simple;
	bh=vVdScUHZzO5lJh4rWpa1lNFYOvDKIArqU+kVoZmZ2rM=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=f1kFPcWvh6FvMldwxZNKDgODoVPLMpsAqWZZuCJU6/4uOEvNl/QQPfiYhJVC6/q/fwQ7v5Uddn6R1u3CwZdgSDgBSvL2CSEadhdf+ThU1WiMHnFMUS3RGSDTQXjTBWn85D+iTxp0eIBmXYlMsU7a59e661alwEBybFtRFeUoGUU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=PCXmEW5F; arc=fail smtp.client-ip=52.101.101.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="PCXmEW5F"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AsvCik5WmTPGHUmqi1Hc69Hq765k0qDEixYiVvVibHufzeAHa8WexxsTnVBJhHwMnYKNj0abElaEI3CO4B2szAOMJ0/uBXAtPArsntk/O1apOffVcdlQBJjI/eVl+jNW5BdkWSxUzDYUdYNp6RXpuVeQ0Aewkm6ohdzsE9vztCmExUMnOyoW95bwepWO18dEvijWJIE+eJqAGvYrViS0z+NCERSkEi/qZBMRvMBhawKXWUj9XeLzKlVzu50vyJ+lJtuqNZ2Ot9WBmHQDGbp/0160zzL5URzUUa4Y/qAAl5LOaRjkmoGwiI6ZkVdfVdFNwFeibjBOT34Q4/zzq6w1Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b15kQWIMV1jSsq6POEZKuI7e6s5uLDakE2RKA7OUmfc=;
 b=pnRLHuKuo1qtiM3zyn2ZmBNG0dFFPgxmd46+f62G9brttKi8sQoEVN7wmEw1uMGT/M8CeC1cKrDlaPprqWT0XizgoxTpGXxwg+54vD4Y0Ix49SrhxlpF0tImDiX79VgxSQPNul6ITqsKgHgt++oI+Thxfjf39CfwWKtQ+hrAcyEOhD7ImVhPZXwpeZp00qgIC/+B3cnlBfo3ZV9HIFzjH3XO4IEG5XA+1c1PO3dfqhutcZNSBQ0ubOSn7rJk49/kPdYWufHUSwh6hRrczcdRz7pUOF+sV4Br9OWI0dKSIHfvu5QAs0TauUe0dfr1kjj7+bx0BL68pGKQNzy3PEaXqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b15kQWIMV1jSsq6POEZKuI7e6s5uLDakE2RKA7OUmfc=;
 b=PCXmEW5FT35hVgDGC3sEFokyXc2zn657f6uyJpS88VtuiSk97EVnvmn4gawcY2b8kMPAHMfyTDkD8frOp0YTpkmt7Hd+44VRvaYnlVi6/DhF3lkkd3suw4kOpDQVig7tRGpPl3rbs77IUICexGNBE8wukwZqs1b0RUTPvAl15+k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO8P265MB7597.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:3a7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.19; Fri, 6 Mar
 2026 10:42:03 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 10:42:03 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Mar 2026 10:42:02 +0000
Message-Id: <DGVMXCZGEWV9.41R0TPTD22S1@garyguo.net>
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
In-Reply-To: <DGVGGGBSC9PI.1TJV2ZAIML0BI@nvidia.com>
X-ClientProxiedBy: LO4P123CA0502.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::21) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO8P265MB7597:EE_
X-MS-Office365-Filtering-Correlation-Id: 21d917a6-6cfb-4a8c-f5b2-08de7b6d00f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|10070799003|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	TNfcsGggMBYYM3mvSEur8FyLsc6CsCUssBY+6ltLN/h/MRym1wBc7rycjRY8RuxrOzC2xepBggEFNYfU5HPxi6UU1rCD8Wy9pD1EEwtB5bs1A+kRijYblpWWBOK9MMButwx/+O50gef+IYG4NTKJf/K6lRGiDGpF6h1yXVSQroLDX5lzaBmgMU+FoKCB5vQZeszaOwqBnjdC7hK+Ym8Cw/B6J9pivp92EkwDlmP3yiLp22fvT92QH6RIbhy2ziosvCkYWsQlGHbI6b6GaTqmAEU7VNxIWwJq5ROkJ+M6Y/FR+ltvinGud5FCujQ6e2xQBtVJNlHEzu9+kZlc2OIbmLIB6x6BJ3xLgw9OL6KR7MohsCP2bXIuRquY5Jnd5hcz3oAPWbbftH2LaSjdHc9N1wNmG192mJ03C3Fn5rZGb+U3fF3Lc+N5ndUDYFrIkxHKQ7uX40YG2cBNsTKQKAPRf93MwT7I3pz4pK1jqbcBeRlAA9FkkdFslPXMMu9q+NayXoY10sakO7jZ53Whf6WgO4rKr4aSQXDD4+Vp4boxe0dl+pMFwhu5csBX/4NnIZjao5Z/0v6VyrLQra0pQ0Z4mddadCk+vb6O82o1e2o7VkxdjgxGGpBhQiUt6yaQpo3U/CASSbUajW36XOICV1A2WXDwQIWcfROGfUmdtoP3uYZJppUAfitlT5V/RiY2m1Rde7PdgPcGh6sCWR6sD/73Z8w7/ppZ9dQGZIibwn52uwc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(7416014)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UHRJYUh1RHlRVGFWNlYvRXdUZU9TdWlzVTE4bUp3azJjRENlemNJY3pTSnkr?=
 =?utf-8?B?ZFFmcFI0aDBEVVhCd1M0SEJSMFdoYWpHcHhiVUNwQmFyM3Z1aFRBWGY3VVcr?=
 =?utf-8?B?MFRtVy9vaXBwUHJqOUYwem1Vc2tGSlJ6ekZTOSs4bUVaSDFYay95a21KL3J6?=
 =?utf-8?B?ZjJMODBEa3gvank1b3E4ZThlNGJCQkhlaWR3eVdmbmFBS1RsWmY4K0ZGNnk2?=
 =?utf-8?B?ZEUrZkJ3WUttZGkwZ1Rrc01Jc0lRWW9HZzRxNTlzMjMwL2F4cFRPdlhtSXBW?=
 =?utf-8?B?b1c4WVAxNHJqWnpqMEY5bmxtcjNwNnY3T21WdG85Ky9zZHIrbTgzNkpibTRk?=
 =?utf-8?B?aitkMnJNSHFFMkhPbENlR2Rwd0Rnc3dsU2ZxOFo3UU5RODIyTkJ4dEhzZnZz?=
 =?utf-8?B?ekh2OC9GanhVL0VOTGlZV1F1RVJWNnQ2b0dDK2RGNFRsOXJZa1hPME9PWXJB?=
 =?utf-8?B?WjlkNFJ6RWtDVUozNWE3b2Z6Qy9PWGVYZVRaTkUxN1hPaEh0TmxaeGE1Yjkw?=
 =?utf-8?B?eFBBNThMRnRVaGtLb2U4VFYyaHJ2b0lnYVFNTlVOaTFQdHVBYTNmS2M5N3No?=
 =?utf-8?B?c0tHL1dnRnJ1eHNVN0pYcU4yOWVwZ2pTck5nc09GZXZLL2s2RUxnS1Zsa1Ax?=
 =?utf-8?B?WSszcFN4OGh1amo3dXpTNDlMMUNOd3RyM2ZPYzlEUnN3NFpleGk1NUpOZURM?=
 =?utf-8?B?dzRlbkJlSGlDZXdzYTBYcEwyNVdaYkpSdEFxWnZ5NkZYb3pDcmdEVjd6SUlZ?=
 =?utf-8?B?aktNOTRaNmo4Tmh3ZjdwaGU3SENGMURlVFJ5OHVMSG1YbVlldDd4TnVhbnJ2?=
 =?utf-8?B?SVc2L01JK1VIcXQ4UExQNnJ3eUw0L0dJYjRxbDhyMVcwRlZtR3VmVk9mQ2lC?=
 =?utf-8?B?WkVnZERHSlB3ZTc3L1N3N0dyaDh2SC9mNDVYeDlTYlFHNTRhNWpLa1M3ZXhw?=
 =?utf-8?B?VFVyNVBpQlc3TUZSS3dpNkVOOTJPMlhqTUY0WUVseG51bWxHS040T2d1SUMw?=
 =?utf-8?B?QmZMeDJNL0IzOVBvL1dsQXVaTkpOYWcxY2VDSVJ6ZUNyd2cxZGwvNmdWSE5Q?=
 =?utf-8?B?N1pTaTVOSjl1ZmNaZk5MMUgzZk9tWkRkaCt5aU1USGhSV1hyMUxLMlcwSHQr?=
 =?utf-8?B?SE41WjUvV05vZFBHNkNuSzNFdnU3LzdkaFpvT2hrWWhveUV0SU4xMTJwTkw0?=
 =?utf-8?B?c3BLSG5GV01xYkxMRmtvR3Mya0NPZENEdEtQRStXd0F3NGdGS1ZXNDFSaGtq?=
 =?utf-8?B?aDBWQ3RMU2pjeW1PL2hVNkxFQXlPbVlaQnMwQ0djSUVPQzlpM0IyK245V0gr?=
 =?utf-8?B?a3pDcGRFTmZSNDlXSlk4RWNTK1dPM0ppT1M0eEZkQ3pXTzdCaFpMK1p4eS9R?=
 =?utf-8?B?alU3YnNiSUpTdytNbUx1Q2U5aWQ0OXJscUoyeUdJdUZnNGZqSk1XMHE2QUg2?=
 =?utf-8?B?bWlqWWpDMFdWN0tBT1VyT2M1NUhVa1hoTzdYMVUrSWY2RzZZNCtkd3VHMU1J?=
 =?utf-8?B?Tnd5T2NFZVN2Sit6bUptM1NkVlVIK0tXc3RobVpYRy81d0xOTHRpVHdXaDJJ?=
 =?utf-8?B?TUY5MEJXSFFKdTYxcGlYWGtPVU8zOFhlUllYL3V4L0ZxL0ZXTmtGeHZQVTNG?=
 =?utf-8?B?VmNjbUM4aWJBOENmWWdxQmVmSWNVZWdMNkZKekJqSGQ0ekhrZW9NcWx1VjRs?=
 =?utf-8?B?aFowVzV4MVJRSUJvaTNUS2tnaVhra2FiSEVxYnhZTlJZakFYZitlZ0ZySnpr?=
 =?utf-8?B?NmhDMnRITERzd0MvYzJIUFZ6SU9uZ01MZ2tDeVVoVVgyZVZUSU9wQ2N0TTJ4?=
 =?utf-8?B?S1NhSmw1RGFraWdtVTE0bUJlWGZUejlxVkhha09yUFAwUUUwL0JjSm53N1E2?=
 =?utf-8?B?ZUxpRHpzcHZnZmgzNmY2eFdpam51K1ZVS2RVZmkwQ2dTaVh2WGdQT1BMUVNZ?=
 =?utf-8?B?Q2RHZkVWSzhQcHNpcnJnUTNYUkVVMGVOQmw0aHFsVjdWOW84YjFFbW9tbGFw?=
 =?utf-8?B?NVFpTFNucnFZSXgzZkVnS0xmQkpUTngyVEFJSm51WGJFOVcvbnpkYzF1RXpV?=
 =?utf-8?B?ZndMRExGeWlvWUpNT1ZhMXVNa1lqSWVQbkRvQzBWV3lqa0p2ejJqT3llZko0?=
 =?utf-8?B?TGIxZ05zZUNmZVoxRXZESnFubklqMHNQTlEzQ0VhNDVlTlB4amh1VjZHeVlB?=
 =?utf-8?B?THF0aHlxeFdldDJFVTZ0REVDY254dUFIZThTaTZjZnNaSzNvVzJkUUdBWllR?=
 =?utf-8?B?eDBDbUFnNVhLSTZEaDN4bTBDV3ZkTHgrY1BIQTNOd0gzS3VYUFV5eUIrV1VM?=
 =?utf-8?B?aEJtbXhvbTJvYllRYy9VQTMyM0J6WGNIWituRmV1T1hRWndybHpBdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 21d917a6-6cfb-4a8c-f5b2-08de7b6d00f5
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 10:42:03.2442
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gvn+wGhDsccza3xJWQLSlzTRJL+bYmDmkFi268UPC8aG2Y47W7u/W14HfGMEHWH9cROkSpIOIQkM3cBFPeDP0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO8P265MB7597

On Fri Mar 6, 2026 at 5:37 AM GMT, Alexandre Courbot wrote:
> On Thu Mar 5, 2026 at 7:15 AM JST, Gary Guo wrote:
>> On Wed Mar 4, 2026 at 9:38 PM GMT, Danilo Krummrich wrote:
>>> On Wed Mar 4, 2026 at 10:13 PM CET, Gary Guo wrote:
>>>> Even for the cases where there's a PIO register, I think it's benefici=
al to just
>>>> get a value without a type.
>>>>
>>>> I don't see why we want people to write
>>>>
>>>>     self.io.read(UART_RX).value()
>>>>
>>>> vs
>>>>
>>>>     self.io.read(UART_RX)
>>>>
>>>> or
>>>>
>>>>     self.io.write(UART_TX::from(byte))
>>>>
>>>> vs
>>>>
>>>>     self.io.write(UART_TX, byte)
>>>>
>>>> what benefit does additional type provide?
>>>
>>> Well, for FIFO registers this is indeed better. However, my main concer=
n was
>>> this
>>>
>>> 	bar.write(regs::MyReg, regs::MyReg::foo())
>>
>> This specific case is indeed more cumbersome with the two argument appro=
ach,
>> although given Alex's nova diff I think the occurance shouldn't be that
>> frequent.
>>
>> It's also not that the two argument approach would preclude us from havi=
ng a
>> single argument option. In fact, with the two-argument design as the bas=
is, we
>> can implement such a helper function cleaner than Alex's PATCH 10/10 (wh=
ich uses
>> `Into<IoWrite>`:
>>
>>     /// Indicates that this type is always associated with a specific fi=
xed I/O
>>     /// location.
>>     ///
>>     /// This allows use of `io.bikeshed_shorthand_name(value)` instead o=
f specifying
>>     /// the register name explicitly `io.write(REG, value)`.
>>     trait FixedIoLocation {
>>         type IoLocType: IoLoc<Self>;
>>         const IO_LOCATION: Self::IoLocType;
>>     }
>>
>>     trait Io {
>>         fn bikeshed_shorthand_name<T>(&self, value: T)
>>             where T: FixedIoLocation +
>>                   Self: IoCapable<<T::IoLocType as IoLoc<T>>::IoType>,
>>         {
>>             self.write(T::IO_LOCATION, value)
>>         }
>>     }
>>
>> No need for a `IoWrite` type, everything is done via traits.
>
> That's cool but will only work for fixed registers. If you work with, say=
, an
> array of registers, cannot implement this trait on a value as the value
> doesn't have an index assigned - meaning you would have to build a
> location in addition of it.

For array registers I think it makes more sense to use the two-argument ver=
sion,
no?

The example here is to demonstrate that we can add a shorthand version for =
the
fixed register version that can write a value to register without mentionin=
g its
name (as a supplemental helper), and the basic write method is the two-argu=
ment
one.

For cases where the type doesn't guarantee a fixed location like FIFO regis=
ter
or an array register, mentioning the name twice is fine.

[

    For array case, you *could* also do

    impl IoLoc<RegisterName> for usize {
        fn offset(self) -> usize {
            self * stride + fixed_base
        }
    }


    and now you can do `self.write(index, reg_value)`, although I think thi=
s
    might confuse some people.

    For the fixed case you could do

    impl IoLoc<RegisterName> for () {
        fn offset(self) -> usize {
            fixed_loc
        }
    }

    which means you can do `self.write((), value)`. I think this looks a bi=
t
    uglier compared to a dedicated method, but TBH it isn't too terrible.

]
   =20
Best,
Gary

