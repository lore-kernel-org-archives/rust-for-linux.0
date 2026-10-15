Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012045.outbound.protection.outlook.com [40.107.200.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76FA149E139;
	Thu, 15 Oct 2026 14:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792074916; cv=fail; b=vC8LTMl5MdqGDJ9y0/XP3VN5KFHPqA9GqciXjkf6bcvpfO/FyT4Y4GClOzbk2TnwGfGxuCWuXnIG7htrGkV4tKKeQMWi2LebORLSr99196cTTmfToOIP7gbul8IxCZHG87KLU2lNvrlwE6TvzD9RTwGnuOLHeFx8mg/Er9m3uKE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792074916; c=relaxed/simple;
	bh=Z64kWoQ/h8lZmGsh3c7ShyejSyDo7ngqowWXtqDiCkM=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=KaDkuJfmpDTxZ34rOrIgzjr0a20bc7fd2HmFd3XPcCJIrTjRm7c05cpt1svt1JuXlZEpXRmbKQNvriWcVd97ufLp+S3w2lmPjNsqKCDAUCuWXEWrBsA8Uh6ktVsTgNdUv0tc+v/+H7a9JLJONUlq1POea18NLAN8XePlmu0r2oE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=smrYSaxR; arc=fail smtp.client-ip=40.107.200.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="smrYSaxR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IuHGJR/ZfUSpFp6XX8IEtixsP38Lm32cUWDMqiV7fCuSRE8Wm816RbxbYpoKiTtq/zjHIuw7kOiHuF3oZh4Th0uEtA/r8zdhw1WjJR+CgzL40YsDY1bszZMTEfihFbvc9JAEzeE3ytBLOUtWNAFI4vGCJJwwQ0eKNcQhhKcywatDvlxt4udtQGemUDiV5/c55uRVDaZSlkwQMlg1VctNV70FdW4tjeoIL042UYp5hY8a9scJatVBQGPV5Fcqng6SpvyS5FUMv2va4vbm2uFQvT5cVtuGNjcDxKVTRLuPNljBZOPy/6T5AkKrHnbtKQS4LAsN+8ptGArLGcdhNj5bfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z64kWoQ/h8lZmGsh3c7ShyejSyDo7ngqowWXtqDiCkM=;
 b=G/FCiOkliGm6KgMycCW/yqqgC7MBZDMc/Z/YPk6X/duSRBWLsl7m53Ixgv3PO80nF3X06D7pS4AplzF1WAsE0SAjWTP69Hn+SrbPc/RFxIoL2HtmnJbocPeqU0KJuXwDlQ0mEsZq5CvXMX7b0y8ZVqwgCKVo6e6P0G9MIY0OTLvZrksoLZnp9Xq26c4Q3Q7Uf7MC3HVjCwoMnaqv/ROnx3Gse/2FCdtw15ktOHTPIy1pTmq9VVtRIeOn6D7pNUkQZ0TJ5L/n8oGs93W1sokfO1pyYJgogQOMUcFqLu+7X9qGqfNDwksRygSpHKQH6w0Boziuey7mCQd0Qp0Bhq7rSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z64kWoQ/h8lZmGsh3c7ShyejSyDo7ngqowWXtqDiCkM=;
 b=smrYSaxRxUyRz9IECH6fTC5hFv25SxGKJkOvtt+JKsh6XEUhIUKwtrHQBb8v296AhIJsVrrE0c2WSs+kc1IcpMzDmoOt6jf0hj0n/zs8E3vH7+fK8O0JeN1wNuNGl6eFPX++cvmzy7a8+kpcitVhE3+oyh/vmUvw9E5Z9xbZp6AtSkD/NhXFAIkMU06l3WuHYFiLdGZvAqAkQ7jecCfGYzeXrX5V58Tx/e2dMrW8GdsV9gXZzTYRe1RDvezcu0Mr9brzbHBSm4ANDpzFsxyvbDAScWpihgSU0u3pvNOqHKgmkiT1iwFwMQ7+Lwh5swSWgZIyJvnmwk7e0rKt0m5QzQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by LY0PR12MB461782.namprd12.prod.outlook.com (2603:10b6:404:233::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Thu, 15 Oct
 2026 14:35:12 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0522.011; Thu, 15 Oct 2026
 14:35:12 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 15 Oct 2026 23:35:08 +0900
Message-Id: <DM5HJBMA4G8R.373NEPOZPLTD6@nvidia.com>
Cc: "Gary Guo" <gary@garyguo.net>, "Lorenzo Delgado" <lnsdev@proton.me>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Tamir Duberstein" <tamird@kernel.org>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>, "Thorsten
 Blum" <blum@kernel.org>, "Francis Laniel" <laniel_francis@npnm.eu>
Subject: Re: [PATCH v3 0/2] rust: add NonEmpty
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
References: <20261013-nonempty-slice-v3-0-4463cc0338f8@proton.me>
 <DM5FG6VMG3U7.1XMZW8RJI2KLM@nvidia.com>
 <DM5GYU1H0Q9I.308S84Y1RV33P@garyguo.net>
 <CANiq72mBAAQaJkL1Yji9hbPjWd9Nm48j6i1G1uE7+KP1kKSHrQ@mail.gmail.com>
In-Reply-To: <CANiq72mBAAQaJkL1Yji9hbPjWd9Nm48j6i1G1uE7+KP1kKSHrQ@mail.gmail.com>
X-ClientProxiedBy: OS3P301CA0049.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:604:21c::10) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|LY0PR12MB461782:EE_
X-MS-Office365-Filtering-Correlation-Id: 01d529ff-6615-4a96-37b4-08df2ac984fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|10070799003|376014|366016|1800799024|6133799003|10067099003|18002099003|22082099003|3023799007|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	M4/htS8YvuTHTtlTDmoDPIQqFqAJXj0iM5yZt8nUdEcElNuKPhMXA8iPTAHuhap1mDqvxUSR6VmUeCTT6w6rm92JkEam4PSx3iDWZJNxLjkVOCZHjjaE5FOFGFvcSAaRkiYbisn2FRjexqdvG0LKSsb29/Ikmx7/Qq5ZD51a+Nln7NT9rfQWHKrHiYXD9NQQ+IeWvFba26QOoQWG5o4EFyZW6rMnedWhOF5e/VX+lOrLBGNj7soHVDyRIAM4riUJHA8e/dEaoBEF9pHTkZoEXT6QkM9HWQ1z8PcUVRbxNH+5bsUxYxtHQRpH8pNQJtREI1DjRy8zDMb4fzcQ/4z6Q+EsVaeOKZNEblvHhdT3kUqrpNKUo4mu/fdxlDFbtGiabwS3A7350e0HeNmszXala9Rvh0tkWId+dJbQiJ/AbdVJXGPAhbmtgqvahE2b6IJGYAM7JEmqtHsoCo89AfOSmHkfzrwiZDt5UiTH7y2Rmn8SZig/AxwD+wPpQsRXyEfra37zY5Dby+1nqp241E7J/U+1ijp3/6edzEz+DMryLgsEFQskKQH1XfGtGabludjwxGYmytM5fP3loyBRbu6cLyUDn/i19EWJkfw8UOS4iE1XZJ/hkX0e+oeObIl+mobOgtUedi9ZlXnhx73VzIqS+/RmII3jBRk+gqdipDY7qH0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(10070799003)(376014)(366016)(1800799024)(6133799003)(10067099003)(18002099003)(22082099003)(3023799007)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VnJsWjEzY0hOQ1R5dlN3TWFKbVN5L3RNSDQyV0NiazNSWEN5eEdHR1ErT3lh?=
 =?utf-8?B?N3Ryb0lMbUJ6K1pKS1Y4WHFieGovdmh1Mm1vZDdMTEQ1VUxPeTRQU2ZxL1Fi?=
 =?utf-8?B?K0FwcURKUmN4RitpSEk5SlowU2lqcmdEaExiWmUycXgyalRMTytnaUdUeEJ4?=
 =?utf-8?B?RW9WcmRLWGttbXRuejhCYkJxZ3pJN3gzQXI5NThQNm1UVDlzOEhqbDYybmtj?=
 =?utf-8?B?aUVBK1FLVkRwM3F2d09zYTlUc1VRbmh6ekZBR1lrcFpzSys3YWtSRm85Y0Rz?=
 =?utf-8?B?V0JMSHp6bzBOMzBtS3B2UjB6VGdzU1AwM1ZORGxSRFJOVkgyREtidlR4VzNM?=
 =?utf-8?B?VXdZWGpRU1htRlRzaGFDamFrRjN4VlRDY0J2Z2VHZjVFVWY5RnYyaXgzSGFE?=
 =?utf-8?B?ZDVMWGlLeFZBajlHMkdacUl4SDhlSnl0SHJVZVBiNUdZT3I3WlN2eDgxWFY4?=
 =?utf-8?B?RXZGSTdVZnAwcEJSOFBIS1NNa1N6bldLZzdYRFBOdllMbG9EOS9KeUE4M1Uw?=
 =?utf-8?B?YWtvNWl6bjlJSjJWbXUvSXlYbjlQQmJobkZyMkl3dllhSVQ5NkV0SlY0cnFr?=
 =?utf-8?B?Tm5PaUJSTU8vMnJ0SUQ3T2ZWZDh2QW1jcHJCbEIzQ1V1Y2hKZVhPamk0Rjdm?=
 =?utf-8?B?dUM2ZWFoL3lPZHAxZkRnM0Zycnh0T0F5TCtsUUVMM1d6bC9kblpsa3RMMWZS?=
 =?utf-8?B?WFFud2ZRTE1DRS9DWTcrVndoSnB0S1dpRnl6RVgvOFY3cThENHUvRlpEcS9T?=
 =?utf-8?B?azhrOE1hZFJkckNGdmUxczE4bnpjZnJGenN2OUpFYjlPMGFPcENSV0h2Ykwx?=
 =?utf-8?B?M2Jod3RGRkE5RFJpVjRhSWU4bUY2ek12ckRmeHJNOS90UytEdVVRYURIV1lj?=
 =?utf-8?B?RmFIS2lYQ2hIdkVQTlpSejVubWQ4dkVER1FwSmxYc2M5RkZ6a0JuczFjc1Nz?=
 =?utf-8?B?NHk4bWpCU0pSMHg3TGlNRUtnTy9xdzZ1cUFUN0Rvdmh0cHVCMWhNcGk3dmVz?=
 =?utf-8?B?TE5OMjdZTHp2S1d2VlBUUzdobjh4d2w0UjhWd2dZMFB0NFZTS1NNVnlhUS9K?=
 =?utf-8?B?Vm15YWh3bHphSFNMalJqekdmamlMemNjY3dQMm9rQkJLN2JtUm9QZVBnajg4?=
 =?utf-8?B?OFdDZEkyMVNONkhVM3JnY1lmT2hzazlGdlhHZElFMmhVUHAzMUxVUjNFaHI4?=
 =?utf-8?B?Wnkrd2JZMEJQUnNSRGJqZWlsYnUxdFJzQ0JYZTM4MEpySGQzV2FpRUhqVFY4?=
 =?utf-8?B?NjExbGFGUHFxR1dHOEx4cUk5Z05QSVlGakUzV2xTTkgrZUx5YmJJT29oRFRk?=
 =?utf-8?B?ZjVDQkVaQVVLbDFibkQvUTI2Y1FnOG1wbnpPdlVUQ1dQRERDSlJXb0U2Nk9h?=
 =?utf-8?B?NlpaOUxpMHU3Y01NTHM1VVNzVzB3dkw3UjV0NUtjMk5MNUVGT3lNN0E5ZzE3?=
 =?utf-8?B?eWZHVFNJTnVUM2xYMTdoa1VBODlHajJvRitDeDhUUDB3OUlGNjI1SXUzallj?=
 =?utf-8?B?QXRxRnVRSm5qckMya25KMTg2YUMwVTlCWHpZMDNBMFNXRXFnRFBEZ3FuS2dr?=
 =?utf-8?B?T3BBcnFHR0JGbERpWU4xL2FCRVpVR0xIZnU4aUlyalErN09mcWM4eTNTWWJ5?=
 =?utf-8?B?Y2pBMjJsN3YwOVd5ekxpdDh4QmFuVTZzUDRvUGxNMDM2Lzh1N3QvVU8ybm0v?=
 =?utf-8?B?UmlEaE1mUWJxc05GcEp5VGpTZnZmemNuZTB6OEs5RU1PNkJuQVhKWFYvU2R3?=
 =?utf-8?B?dFZyMTIwOUllbklja0hmWnFjZm90TlhidjRvUGRxL0RvMnRJVmxzTFNaM0JO?=
 =?utf-8?B?bTBtTEpNejRFaU56aGxOeUhrVVIyT0tyY2VVZFdwWWk1eUtCZHRyK1lrQUlZ?=
 =?utf-8?B?SXFxVllsRGdVckg3Tk9OT2ViVi9TZGh2TC9DRDA0Y1lPcEk3QzI3YitYS0lq?=
 =?utf-8?B?RExhc0VaZjVGNVZpRU5Na3JrVXNvb1VqTTIrMU5UOEdpa0piNEtEMi8wbXo5?=
 =?utf-8?B?YzJSK3pFN3I5bFFOVUxhdGdkQi96aDJMQzAwLzhEUm5ucFU2WStBVWFuK25X?=
 =?utf-8?B?bjJXb1VUMzJ5U1pidERFR0dpYXMrNzIxYzZMZnJnTlQ4TjNHZkxCOHE5ZWQr?=
 =?utf-8?B?Yy9OSHkyZlRMZmlQUWViWFVzcCtxS3N5SmdXTng2WmhkcnJ0cjMwMnlrVjJM?=
 =?utf-8?B?NUs0a0cxR1JwT0w3b1BPbXZEV1M5ZGh2VnB1Qkx1bDFGOFh3STk4MSt1dXRv?=
 =?utf-8?B?dHVZcnpCZUtlQXA3RmJNam4xRlB0ZDVzVUN3UjlWRXR2TzlKclZ2MFZxdVRX?=
 =?utf-8?B?a0crMHQxSExiNi9SZ3laR0tVMWx6RklSYno4ZnNQdkgwMFFPb3l5RzBWTkt5?=
 =?utf-8?Q?tksuzLu+5xr1tVFL0D+qmKYVVOey9eBHho5+BPgd3g7FT?=
X-MS-Exchange-AntiSpam-MessageData-1: /EM15mP78EryJg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01d529ff-6615-4a96-37b4-08df2ac984fa
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 14:35:12.2383
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 32escHO9FnFOKDOemOykhpPk0JmUFjWiULqX70gNd1ARKGikvNRXWg9wAJST9Cu4mH2TpOrmKghZYkkf2b3qkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LY0PR12MB461782

On Thu Oct 15, 2026 at 11:11 PM JST, Miguel Ojeda wrote:
> On Thu, Oct 15, 2026 at 4:08=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote=
:
>>
>> `kernel::types` is too generic and becomes a dumping ground of things. I=
 wonder
>> if we should group things that are new types with just range restriction=
s
>> (together things like NonZero, Bounded, and perhaps eventually Range, No=
nNeg and
>> others).
>
> Yeah, we indeed had that problem, which is why nowadays as you say we
> prefer things to be more split than less, because going into the
> "grouping" direction is usually easier (i.e. it is easier to comer up
> with better hierarchies when we have more types around, but it is
> annoying to have a big file growing with no boundaries meanwhile).

In this case maybe we can resurrect the `kernel::slice` module for this?
