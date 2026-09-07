Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010012.outbound.protection.outlook.com [52.101.193.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F64448CF3;
	Mon,  7 Sep 2026 09:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788772918; cv=fail; b=OJLxA8opRl1i/wf5DUI+hVpVkbcW9wGR4ZywfkbuxVCp8tOy0PFha1IXgsh4vZgw3D3Cjrhp6Nft9q4oSE8hoO5k9PFACh5Y1zCU9QEg+8kRs75Nvq2dVZlDUXaOny0c/ZTSN/qHGV62CraPqCRFxC3+gngh6xJ3Jl/5tLRdNUI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788772918; c=relaxed/simple;
	bh=Wvsfre2vfSZFXsaK62ItZ5IbuCcgM/eL6zgnzBnPk+E=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=FXeT68Jb0woMgheyDxsOVTukJFJy5d/gtfvERaJ6GmLs47qfsgCPGd7sqLfUfz5SKo/2zR2F5F6S1ii75/LrA65cPZAQfomVbTLoGpyZ1x2CwEk5ZNsLLSTJY9zivTrx0CDfJtS8Hs5i5TNVIcAB7AXiESIkXS28rgt9D0jg1Rk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=TKYNf7Ln; arc=fail smtp.client-ip=52.101.193.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="TKYNf7Ln"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cjMkpU6Rg8etwZUXPlrN7QZLqztSPaz8hp68hRE2HRO/LYFQAvjJCgCyrH4UX9UoqbspCh+q4Pz2dUC+1sFPVcU+6oyJLQTlIzil6UcyKbiBE8RWH0BD/t9B2PzYelqGUPCVSu8vgT+04TXuy57MzEeaNgXWbb4pmkh464hWidQaViBRDH4SZialazwiVxEGziwItzYVgIoo6FpLgeP+iWf+5+7hpgHUW8gDPVBpGuhpmBxYzz9j4flLF6JdTaNQP15EKKwwLsYvXZJnOs6rwHzH2eKPrgAJTdSGqHqwyaZwkVbpwuV6pdtfqJ2aLZGaYdqOe1YveeB8QNuF3TzcIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bSjlqsrnrvBBsSnENLy18BE84re8sOVfz/o+fWyJe6A=;
 b=nsoMLkR0oSld28teALP6x+mVBd/GgnpwJz2BNP/pv7JkDa/H9kTyK8zkKzeNk4oCtsdkRGUrrjyhtLCAkwY2Wr/NvaKWrFDMsC3szX6KAv2RQoDMHUY+dc/Uv7K9K1u4pxU3uarxFS4uC7WiThDVmTHs08G3PMLmBvU5qZa+FFEDNhbsberXKw6yIh0qvdlTsaXHT3RpefRMjuCO/MOObtZ6nMlOrndGjSbeWCVBT+dMBCfwQCXT8fyFPd5hjsUnGgpJRSDVpYI4HC6YMjb0CsvDWpA5X86sgTLtLbAkijkq4J3aXplZ7ANI9lBxnAyo/2yjetAi+ydA05gW3bv3cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bSjlqsrnrvBBsSnENLy18BE84re8sOVfz/o+fWyJe6A=;
 b=TKYNf7LnDr/X4yYyssWUZaJg6g13Dy1Dwt62eXQcerNtFpIoOTa5wBF283A/xjhFJxEaF6DcqkbBzrm+KIxqBWcuxh+S5G1GnWbNF3hcXZ2zyeUNhe4T3QYMkU+NLLVjh5A2sNXRStq7ApCUNim3PC45g9GtEQ85dSfeEzId4Z6dk7SJd7D7830BeNCajAWIPfVSQvPMVUgdJA3GzK3i54779uiXMyJyyAgnYKg7uopO+BG5bebRRMmVJJbR8QRAUG94bCUUTu4IOD3TWBiRTLzUVvI8UGgtArtqthxjw3SoMzwqc/qeyUvNkk+ZkwvAPMoi50Nbw+GmqaMksTaoyg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6413.namprd12.prod.outlook.com (2603:10b6:8:ce::10) by
 LV0PR12MB999094.namprd12.prod.outlook.com (2603:10b6:408:32e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.14; Mon, 7 Sep
 2026 09:21:53 +0000
Received: from DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa]) by DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa%5]) with mapi id 15.21.0382.014; Mon, 7 Sep 2026
 09:21:52 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 07 Sep 2026 18:21:46 +0900
Message-Id: <DL8Z2OZLK8KS.1KVH6W27ZTOWG@nvidia.com>
Cc: "Eliot Courtney" <ecourtney@nvidia.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Tamir Duberstein" <tamird@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2 0/3] rust: const_eval: add a mechanism to do const
 trait calls
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Gary Guo" <gary@garyguo.net>, "Miguel Ojeda"
 <miguel.ojeda.sandonis@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260903-cv-v2-0-e93b1613e40c@garyguo.net>
 <CANiq72mgqhjAYR-a5gSnMjK++TVc1n6RFpj=Go6QqXtQRX3=9g@mail.gmail.com>
 <DL5SQWU5QH9S.1F1V38FAA5Y4Q@garyguo.net>
In-Reply-To: <DL5SQWU5QH9S.1F1V38FAA5Y4Q@garyguo.net>
X-ClientProxiedBy: PAZP264CA0116.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:1ef::6) To DS0PR12MB6413.namprd12.prod.outlook.com
 (2603:10b6:8:ce::10)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6413:EE_|LV0PR12MB999094:EE_
X-MS-Office365-Filtering-Correlation-Id: d0467003-cb3a-48da-71fe-08df0cc17434
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|23010399003|10070799003|6133799003|10067099003|4143699003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	b3IKCE6+JukNpiaVRmAKcN1ZX2wcGhLf/ifQQTb3JH3jOQlxbjW+nOSnmz770Ou+13xZXDtlNSMfLywgTz9TU2+dBJ7VNfVyigmwbFWtChQJpzflcnbFJCkYRM8SMVZxEM/e8vqz9Xt+F2dCrZGkUkJgo4y+zRIXFt4NWddyVwHv+mWCJzh5bVf/r+YjKMmQLciyYLHzh19WxW+fDV0MnEGn55Gilz9Kz02HTz/Fey/zx1L7pHqDUUSfQ0src5mM02qvd/9G3dc42mDP4xyJ3KjyeZqb9BKBGdEzDp+0ElCtNC3aMLK/btYKQA849DUKA6FOu0P4wcmyr/NgIYI6EjRMnaGfz0TSeHBQV+iyN2Co2lQYwCH6EVtcuN4bvvSVtE69xM3GW+psVnGgNtqcfujX+/K5K63texdEJrCFzRAtbKaYDyFjrkPWm67n4ml51NsMZM2NT4vRte8gk0UXpJofDmc283UPmJ7rQ+G2QhnSmjgCA2roIRVk+aQAEWUDVBiv6NGFjI1kRaJyIQOc7aGTQP0RIeYvaCExejoOxNmt6PQuo4cyltH0GWq5LeVAjOn9KD6dDIQ3g2J20hilVBvA0m1uNWSOBKcJ6lvRHCrj4pyMyib0an5fL0TjMyvM5zQuyQ/F+BE+PmlxWzCMCC1nnX4ZiHQqLmNkw788cKk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6413.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(23010399003)(10070799003)(6133799003)(10067099003)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WUFhTURMU1pZMHJFbzB0bCtoUGhVKzU0V0NrWjVaaTMvY3ZkcDVpamNPVjdk?=
 =?utf-8?B?L1RkcWhMZ28vazBZdWlzU1pKazJEeEc4TFB0WGNhaDRCWjRRUDYrMFB0RlBN?=
 =?utf-8?B?V2ZlQTdXOFNNWCtCdENPcmd5NmdjNkR4dW9aeDJSVlVkWkVZSWZWUUtkNEM0?=
 =?utf-8?B?djE0eHRwcCtFVFlYa09vRWtGNEI5SFJvNGpMUklNVVdNS09YSkNLZHRCa0h6?=
 =?utf-8?B?VGMrRWJvNUZVOWRVbUFyK1BGeVFnb0g4WVA0eng1dnVNN1Fmb0NXTVJiQkdO?=
 =?utf-8?B?SCtFNjZvajNjYzEwWkw0eXVoWnhGWUg2cFZHcTgyaWhLWmpPanV5a1d6TUlj?=
 =?utf-8?B?eTdEZFEwcDZZOWV4Z3pqUHFBczlZOEZOand2eWo0Ym1XNnZpZFNZVGlQNlU5?=
 =?utf-8?B?cW5FNGgrci94bFVxbWJ2ZmJpWjFvN1lkZzJUdGtHV1VIaDgzZ0xNajJhcFh3?=
 =?utf-8?B?UmRmWG5PUEJ2ZXd6bUxUTDNrZHVpSmpUTFQrbWxia0ZxZUU3ZnBSem5zVFY4?=
 =?utf-8?B?M1JGcHcveWdEWkxEa0hsQ3BoUGwwdERzanJKWStsSlJGeHRDZGkwQUFFc1JZ?=
 =?utf-8?B?QjJiRU03TlZaa2pEK0cxMkF4d01xTHVaTjRabUszTFdYSFJCU1BZTEZkcEVx?=
 =?utf-8?B?aGNkTkdTTVlLRmRKOWozWVIyclhEemYrOUFyTC90dnd4d3N6eEN0R0VmWFhz?=
 =?utf-8?B?ZlNmdHptNzdxcUdvMHJVdHVRY0t6L1NOT09vM3lSM2tNYW4xd1hyRWpveUw1?=
 =?utf-8?B?cUFUMTNtOWlDVDNrMmhFaHZIVnRVWlRhWVZSeFFDMjY5SG5uMmtkbjVjRkFR?=
 =?utf-8?B?MTF6YytaSUJqNERYN3ZtblBXbURlbzJHR3o4UHBUcGpBMUFocXVWVTVPblJL?=
 =?utf-8?B?QjNKeU1pTllIR0FjUHI1VjRTRFhaMFpnQStFQlE3ZGU4Z1pSUU1ia1hPWDdV?=
 =?utf-8?B?MmVBbzhibktneEpiaWFKVU9Uekszc2JxcWxsZ01QMkk3eklJQVdsVlIzTWVL?=
 =?utf-8?B?SHZyb1RjekdqSU4vZUJBL3RDTzZoL1k4dUVmWlJhM3RsdWFnZTlwdis4a0FN?=
 =?utf-8?B?VTBwRjJhMDZiVVV5cXdCR3c4T0dXN1JmUi9xb2hRQU9VSFZYYzIrS2NEcFhY?=
 =?utf-8?B?cFQxcDRHdWxndlFxbUNrSnVMUkl1UjJOdkhjOVgyNFk4d3ZuRmQyT0piYzRk?=
 =?utf-8?B?bm1ETEtwMXFsZHhzT3ZUYkFmeDFmODl1WDI2amp0OTVyQXBWS2pxU042ZUpa?=
 =?utf-8?B?a0tTM1p4Q0tPUjNnRm5ZNExNZ1pRL1FwMTU2b2lWaEVsRlUybWQzSzl3T3A0?=
 =?utf-8?B?UDlqOTdHb2dFVTUvSXl6RUdDeEgwUG5VaXZkUUM3YTdVSDN4cEpqdHlIeUx1?=
 =?utf-8?B?UlNBejB0ZHNFQmNsVWVPSnFXd00xcEhuTTNHM0xpQ2F2a2pWMXk5TnZsWFdT?=
 =?utf-8?B?MkQ2UFFDZjYxZmNzZ3ZKSHJvNDFoRU03Qk5pQk8zS01pUndJd2ZQd3MzdGZP?=
 =?utf-8?B?ZGtYaENpblY5Z1pwRXRIdHdKWWlvd1lQaTRxd0o4WS92M2daU2M5R0M4eGd6?=
 =?utf-8?B?UWlPOUljVzRYWGRVQXRYR0g4dEVDMVI0akVpRFo0dWp0cHQ0NXV2Y2M1dWs0?=
 =?utf-8?B?bDh4bHBUTGZwWmRJSE54OFg1U3JkUWk5WnhqRnZOaVpkL1NORlJlYTVOblF3?=
 =?utf-8?B?T01wakxCemRTSUZ3YTgrNlU0R2p3cWNZRWc1MnNJTk1nWHJsQzVQYlFGTkFD?=
 =?utf-8?B?RlZNWDd5UUQ5N0V5a1llMXVyNXJ1WmNSQ0d3N2I2T3JVN3NKcmQ3eXF4Z3JM?=
 =?utf-8?B?VVVXeGdRaDNLaHB1RW84cHg4WjN1Z1FWSEZNNy9qUFdjcC9ZUXNFU0F6N0dp?=
 =?utf-8?B?bkRrOU5FeFoxUjJqUm9WK2lPaDRWemFDTFFGMXp1Q0FMMmJoZFlCZzNCdlRz?=
 =?utf-8?B?c2xldWh0bVlLWEh5dkV5SFg1WlpBRFpCQUR5dEt0b0Q0OEhQRXBGc2svZkpI?=
 =?utf-8?B?ZzRBazcyTjN2TmJxVEVYN1FrUDJubWpMY0xkdFVWK0JlMHl2aUtiNTVCcXBH?=
 =?utf-8?B?WGJLRWpIRjBMOGo4Sm5rd0R5QzdsK2VPOTlJR1FLMlc0OTV5WURRMlNLN1VM?=
 =?utf-8?B?b1l1MFFaSHBpMXVVejkrTzVjTEs0SkdyUnRQNVJaUE1jNVQvMXlsbzE2Tjg0?=
 =?utf-8?B?ZlV5bmJHVkM5Qi90UlBuUFVEQlVqMktHWVRBYTZaVjUvYWFJQTdMSTIwdUJW?=
 =?utf-8?B?YXg4UjN2MlArNkRYb3l1NXZ5MDRETFBkMHlyQjNkZXpnRUx1OG5mZWpzdXcv?=
 =?utf-8?B?MDcrKzhCMWZ3NDZjQ3JYOWViTFBBcEUydzlrVHhQNUM3ZGpmNk5STkJKcWY2?=
 =?utf-8?Q?Z8gPeWD2DDlf8IpP/+zm2o2ACnl3b6RqB5yiNf2zbb2U0?=
X-MS-Exchange-AntiSpam-MessageData-1: rjz4ftkJ5xuwMw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0467003-cb3a-48da-71fe-08df0cc17434
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6413.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 09:21:52.9391
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i3fEeRUaDhpG4uE72UW+XDC0zYxHgbx83tzkEXJOxgEGKnIly2a2dYDSWPL5shNZZOgAOH6/hbo58CpUqAricg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR12MB999094

On Fri Sep 4, 2026 at 12:46 AM JST, Gary Guo wrote:
> On Thu Sep 3, 2026 at 4:34 PM BST, Miguel Ojeda wrote:
>> On Thu, Sep 3, 2026 at 5:21=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote=
:
>>>
>>> Add a mechanism to perform const trait method calls, with the same type
>>> inference capabilities. This would only work for concrete types (not in=
side
>>> generic functions).
>>>
>>> As an example, convert `as_char_ptr_in_const_context`, so instead of
>>>
>>>     kernel::str::as_char_ptr_in_const_context(c_str)
>>>
>>> one may write
>>>
>>>     const_call!(c_str.as_char_ptr())
>>>
>>> instead.
>>>
>>> Signed-off-by: Gary Guo <gary@garyguo.net>
>>
>> Thanks for resending this!
>>
>> So I definitely like having `#[const_eval_only]`, because we do want
>> to limit those calls sometimes and it is nice to have C++'s equivalent
>> to `consteval` (perhaps this could be called just `#[consteval]` to
>> match?); i.e. what we talked about in the call.
>>
>> On `Const` and `const_call!`, i.e. the other two patches: I am not
>> sure if we care that much to introduce a macro for it, but it doesn't
>> look bad either. I guess perhaps it helps to have a consistent way to
>> do it and to easily remove it later when the actual feature lands in
>> Rust. I would like to hear some thoughts on it from others.
>
> I think it's good to have such macro compared to our current approach; it=
 can be
> made into a identity macro once we have const trait impl.
>
> FWIW, I even considered an extra macro that allow you to write
>
>     #[const_trait_impl] // #[const_trait_impl(foreign)] for core types
>     impl MyTrait for MyType {}
>
> and generate the `impl Const` part too (and also add a line to the docume=
ntation
> that the method is const-callable with `const_call!()`).
>
> Best,
> Gary

I agree with the consteval macro, that sounds very nice.

On the const_call! I have similar thoughts to Miguel. I reckon if we
have a bunch of prospective users of this right now, and some thoughts
on what would use this in the future then it's good. If it's just one
use case right now, then not so sure.
