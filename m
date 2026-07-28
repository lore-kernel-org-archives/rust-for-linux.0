Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021119.outbound.protection.outlook.com [52.101.100.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD57D3A7F69;
	Tue, 28 Jul 2026 14:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.119
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785250352; cv=fail; b=pAopaIojdNF9xG0wXzHM3fgv9pqQmbJYlH5buc7ncZIOjGgZ3yHhfuBrPRDlEnR+qcyVJDwgFQeq40rK33/iLQ+umjcwnxa/g1PNTZlq5/47OYezcryF2OLU7vO2nJtJtIrhmU4LaIIh4jJvtQnHfR3VnSub5/+/AGl+EsfxmXs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785250352; c=relaxed/simple;
	bh=KbCGgIl0wMc7UI1Nebpiei57LyS8+vOOvCwJ4P6pD+8=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=rkIfKCFQ2pdmaA6dTACCepFkFvlHIiW6coC91TNkO3KtdZ9xN796mcXdTOcXLa0y+7y1cmFj7v54wthx0qOcsw5StfyIqyPhPedco5nDKaH8Y0CODJ6Inbo9sqBxI+uNfGVJ6VKdF2KwpwJIEOGvRjZ9UEyaGDNJ9nR9Zf75qws=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=cNsrv9VB; arc=fail smtp.client-ip=52.101.100.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="cNsrv9VB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rA1/FgPKULurYKGaLqb+ua4hHPV7nhr0DkRozGEry0X9/hmfcXk1mSuRYaaumFaN5ubuPIkll7mQCeg0/SP4EGAF4QRv4vbLtICe9uYv4gIGveBLLxcAnHnw+ts4YdD+yeVI1B+5oNQKWPuAZWI+yg6t/+zGiOgrJAI7F7cil7xYsUYBIzoa5+6x+ywnxrJYXOTsgDyz1Y+6GeVBdGCeWNtuKHWgJQtBLENlcKvncwHoxDnc+j7qFLJbHZaUqX1kRnOVaAkDH44r+LG35aLnRkug4d7K1NYquCy1M7qb5vzsYI4kzzVrI/CArQIXgl8isN8ERJ9NdHg64yMZ/hiKVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sS5p0QbMNkOHLO+4D50MItzu7zIg8Tuzdd7FJu161BY=;
 b=Lre2kIc8howQdLtxyKBvM502fQqfd83APq9I6v2StV1L4zYIYF2xpsfvCmWzghUxxKI0S4w+OQ0w/nk84rGaVYrUtMjV80hv9cN/iUZtVAfee3hR4q2DMP1ymqSgTTEYW25h0OwAqE09c0xrMpTt8GvIQYFXd0wnrh4CxFv0/SBK51xYxtEYeXQCR8ONe+4E8lUMJ/zFMON2jfcK6ipKThkNSImqMhSQZbrw4oUnbIkNYCvgNUIJmdCuv8ouIM/caYvJNQNcJwjlQcAMKpYcHsrmpCiprVD/fxNtHoAyHYyIdATBto2U0jyzm2N7wJMMmp7rXxeuYD14leG1hVFABg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sS5p0QbMNkOHLO+4D50MItzu7zIg8Tuzdd7FJu161BY=;
 b=cNsrv9VB08aT8H3VHxo+REDJKrADPDxMft2AK+H3e3wzARszHQjIciltAVLG7589k557bsoFKArYm6ngePOTfDkzFTuS3bnSY2BsH1L9AwNi6+P5Wq8Z2OIMxJgK7fxqCJQHlUY+TYRr/+NvL2MKpIi8hPbXRgvf63c5IZwq6ks=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO6P265MB7374.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:31a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 14:52:22 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%2]) with mapi id 15.21.0270.009; Tue, 28 Jul 2026
 14:52:22 +0000
From: Gary Guo <gary@garyguo.net>
Subject: [PATCH 0/5] rust: print: add "continuable" as option
Date: Tue, 28 Jul 2026 15:52:07 +0100
Message-Id: <20260728-printk-v1-0-855606634d70@garyguo.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABfCaGoC/yWMyw7CIBBFf6WZtURKURt/xbgAnNrxQZsZakia/
 rugy3Nzzl1BkAkFzs0KjB8SmmKBdtdAGF28o6JbYTDaHPXJ9GpmiumpuqCHcOi71loLRZ4ZB8q
 /o8v1z7L4B4ZU62p4J6g8uxjGOr0oLllFzGn/dpKQYdu+HKySQY4AAAA=
X-Change-ID: 20260728-printk-3c0fc5831444
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Burak Emir <burak.emir@gmail.com>, Yury Norov <yury.norov@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gary Guo <gary@garyguo.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785250342; l=3705;
 i=gary@garyguo.net; s=20221204; h=from:subject:message-id;
 bh=KbCGgIl0wMc7UI1Nebpiei57LyS8+vOOvCwJ4P6pD+8=;
 b=sM/qDodvaIv3TqBYO3dINfl0O/fbRWARqwn8d6VNn9b8+G0SB8f6ni+aEVEjbWFDhLoC7AtXG
 JnHYMmvnxLHC4lwOccfNifvxqQVRrZNku9OMDBJW/mCqnxIlkczGWOA
X-Developer-Key: i=gary@garyguo.net; a=ed25519;
 pk=vB3uIX95SM4eVrIqo1DWNWKDKD2xzB+yLLLr0yOPYMo=
X-ClientProxiedBy: LO2P123CA0107.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::22) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO6P265MB7374:EE_
X-MS-Office365-Filtering-Correlation-Id: 649bfab7-bab1-4b8f-9aea-08deecb7d4bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|366016|23010399003|376014|7416014|18002099003|10067099003|56012099006|921020;
X-Microsoft-Antispam-Message-Info:
	ADSICKSHeorSCy61JOgfIrqN8XhKLbX6f+amSY5+gWg39DbK9IyyH4StpkBq14ppvu1LLk9Pz6tSasDE0yaItcpZHdKDC/MacbyEODGfeDEx+0db2imTQLKNkDZzDeHUO3VdjBY9SUxcLT5JMEzYKL310swmT5wWZt2YGNBRAou7F8Hk4ts+YDtP0bIWzASB6X1g8qiJDSZB7BLQUabQFSdSsL8GPce9+xsmjLEDsxTKp79rwIq/7JHPAmPbDNI/jSySeEhmub76h8tdvtBVt/ZW2oCzjrD3oPHiYmht8x7/W0XhFSs/oaSJpuhYNbRZJdirrTesNgmo8xuCQRulpKtSx8t+bPg2Z86VyoUAQk1OBDNXWr7oUudR9pRVsyMJngUNDUTgYvwWke07pnK42UYbf7fIHnYDRS2pPZ5hanus+2uCzk4+zIYartrPdAxNYacPMyPvaiCaIVRiUtJwm3hce1EokRdPaeUmJcteNmptRWUuAG0rgkCJCY4rFtmQcs0hfTnLyW2oZnMbiYgv/lGEAj47l2A+U1Ef1UN81TmIvbuKOntIkJfn/dNB9CZE3DCNPLFsatk90RqzMqEHZdE2FuGWEWgeKokPqVfNYARHYxZAlOGJbPIbvW5wS+OLZj0NKuscqcKUGv34Ls9jTfqkppM9rW3pVK1cALAnU8wL5EXCCtma1uCbti9fadsyiVv+8vDnnNengm9pNo1ThQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(23010399003)(376014)(7416014)(18002099003)(10067099003)(56012099006)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RjRxbTJmb1BjSy96Vkk4eUcwSzF3V1dmTEZOV3JtdFREbHdPMVdlOVJoVmUv?=
 =?utf-8?B?NXc4bnJJV2UxK2ZxM1dIaUJiU3ZxTFFSUGpMN3pYc0pVaEYvUWFwd1RjNkln?=
 =?utf-8?B?VWkvYlE2OE54SjQvMDM3a1NUT0VzNHlKYllhd2FSanZYbkEwK1ZWODZYUlo4?=
 =?utf-8?B?cHpuaDNnU3pVSmxqdnkveTFIVzI3ZncrZC8zcE1lN0pqTEl1ZkJaRUdPdXhU?=
 =?utf-8?B?amEvV2YybzIxSGd3RE5HNUVjOUdkZzYxSDB1ZFVmczVOalNETmFLb0FZY21q?=
 =?utf-8?B?cTNpUUFyVW5pakRwRnFrZksyWjJBUmNnNzlETVBoejFpTTJ5UTRYdjJRNTRT?=
 =?utf-8?B?bTYxVnVQeERJT0dTMTcwWVJ0M0pSdElLbU1ac0UyUTZJU3Bnc3VFVFJuYXlZ?=
 =?utf-8?B?UFoxelk0bWVDZW9TT0ZWNDA1SnBxc2Q0YnJsWHFrNTF2bnpRNkhhRi9oTnhF?=
 =?utf-8?B?RmhSSE1XdWpyOEtPQjV1cGhmQndlcDMydHduK05KbHFSdXdCNVl4ZHJ3bjFl?=
 =?utf-8?B?cGoxMk9LcUo2TkJPeW5zZzdrL0lKazdjVXZ5b0FyWVY1aXpxL2xXUmVvczZu?=
 =?utf-8?B?Nkg1dURwUXBiYzRhMDQ3SENYTHBZSStOVm9JWmVoLzhGWGQ0dU1TcjlnNXRK?=
 =?utf-8?B?eVVVN0JRenNiOThyUVFzUEJzNGM1WVRYODVIRCtkSGxWQ2MvalRBZ2VjZXhE?=
 =?utf-8?B?VURaT0U1R2UxZm94UGo0MDFkVVk0NEhpcWljMlkwMUxyNi9DSGNPdjhQWHIy?=
 =?utf-8?B?RlR3blBrS0taUTlpbmRlOUpwUXl0bkJQVXBuTTM3Q0JhV2dmRnlKNk4wSjVE?=
 =?utf-8?B?dmk2QmY5dHh0NFlnaUtTUEFjR2hCQ0JpR2g3ckNlVHBySE9UQ25IaS9jaXVr?=
 =?utf-8?B?dU5TZHNiYkVCME9hREk1TzZKYy9WcTFNbGNlRmIrSlU3OGQzRm9UeDFvNis0?=
 =?utf-8?B?TTVYUGRMNURGZlRmOEtKTVJjRFVtaTI2WmRHbVZUUDh5K2tYanUybFozMHVT?=
 =?utf-8?B?V0hGWmtaV0k1bE04V0ZFZ1VpaURiMmI1dzJ4dHd5d2xDb0ZxTTVkK08rUWxo?=
 =?utf-8?B?UU1OK0ZCMWJqL2diZnRHWkRqMUNCbVdUbFFsM2ROWk1vT2xNRjBTdVZNSEFv?=
 =?utf-8?B?d2xSSVhHZ0pkMm8rNVpObzZrVUdpcXJhRHZIc3hPQXdDY1EvSHp3TlRqZnBS?=
 =?utf-8?B?ZWEyeUZ1RFBNNVV4Rk9QN0o5bGNLY3o2UmZtUms0bGtVYlBhN00wRHBWYU1Y?=
 =?utf-8?B?VHZ0dWhQa3JuUFdHY0NVa3N6cXdkTHRjRk1lUlBVSEV6WndoU3Bsc3ZTM09v?=
 =?utf-8?B?M1NHaTVGNnZKOXdsZUd6TVlZNXdxWm94M3NSSVdoam01UjdTWUVzUGNQbFAz?=
 =?utf-8?B?b2lzZk4zcWtYamNuUVV1cDlESmwwTnkvN0xHOTVhZDZPOEZVRTMxN2RBZmxo?=
 =?utf-8?B?Yi82TERCb3Z6eG0xZHVVcHdwZ1V0NUYwbngzZHluTE81dmF0NVoxMDFMMjll?=
 =?utf-8?B?L0dpOThPQjZRZysxOGx0eFp2RHZhdzkzZWpHVjFiQXV2VzNvT3Y1RTVNbTJh?=
 =?utf-8?B?RFFFWHFSakRhd0JIaGVCOXE5eTBUMVYwdi9YR3NqRXFBSjg3OFZsTVNGMCtS?=
 =?utf-8?B?WnhTUGpLcEU0SGpFcTByRzNLeksxWXcrYTdyd0tGVU54QnhmQWlSbnBBck1V?=
 =?utf-8?B?NWhJK0d2M0VVdjNGck1GTzYxeEo4MmRuQW8zdjR1WlZ0eDlPcnJuR3lEVTNW?=
 =?utf-8?B?VW9mVTAwVGhwWFo3OFY1WG9GQVVCZlhqaThyMldiRFBKZHJ3STFqTTFyNzc5?=
 =?utf-8?B?aStFaDlDbENrZVVlUlRNTFpnZzZHR1g5U2IwUEJMSjM0cWppL05aVHBac3hv?=
 =?utf-8?B?UmMzVWpVdyttVmI0OUZzSGdzZGxSdFpPSkJUbDhrdGZZZTk2MFRESnFkUTVk?=
 =?utf-8?B?M1NlUm03aUhJRmZNak5nNzZxd213S3hjSVVwemNVR0xMTmJta21DQnI5TFkw?=
 =?utf-8?B?WjV5blhoc29TM0xzZTNMNE1nZC9iUmpyNFovYVdsN1BZa3pkS3dCR3VCMmtV?=
 =?utf-8?B?czBRcUZyUjkwUVc4SmdDazF1dEVSdjFKSDlRWVNFVTN2em5KeDY4QVFhd1JU?=
 =?utf-8?B?RENpNG9RSWlKZnVOaDBwSGNLbTk0K282ZWpKbXo1MC9LTVhpM2FMWmdiNkxB?=
 =?utf-8?B?U3ByTjNxbGVsczl4RGlYY092OURWdk96MmhTQ0RoemNvYzFkR0wra3NRblNI?=
 =?utf-8?B?MGRZNDA5YzdzOHJzakJocnZrMytKMTc2U3grWktscWc4YlRYVnZPN0VWSWYx?=
 =?utf-8?B?WGdaUXRSeS8xak9wRXNIOXBXTE9CUUdUc25ZZEsyVGY3eFF4OWRPdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 649bfab7-bab1-4b8f-9aea-08deecb7d4bd
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 14:52:22.6443
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZJFHQTHbMqxmsgP0UY1oS3j/82LIHb4d1KGv9Cqxk7+BzLm3We65lREnYnkPeeQIfMfX2P4gXxX/MoN0oA0P1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P265MB7374

This series include some cleanups to print macro, followed by the last
patch which adds "continuable" as an option.

This is some ability that is unique to Rust macros; C macros cannot do
complex matching, so the options to printk are mostly specified via string
control flags (like log levels using \x01, continuable or not using
trailing \n) or additional macros (e.g. once and ratelimited).

Rust macros support pattern matching (macros by example) so it is possible
to do more. In theory you can do this:

    // dev_err!(...)
    log!(target: dev, level: err, continuable, ratelimited, "my messsage {foo}");
    // pr_err!(...)
    log!(target: module, level: err, continuable, ratelimited, "my messsage {foo}");

Userspace Rust logging usually have levels being part of the macro name, like this:

    error!([options], "my messsage {foo}");

Danilo points out that we still want split between pr_ and dev_ [1], but I
think adding options would a good to have. This series add an option
"continuable"; absence of which indicates that the user do not want the
line to be continued. The name is preliminary; we might want to call it
"cont" or something else to save some typing.

With that, we have the option to auto add newlines to the print message and
not having trailing "\n" in the macro invocations. I personally think not
having "\n" is better given that printk is treating it rather like a
control flag of whether message can be continued instead of actual new
line; it is stripped away inside printk code eventually. Printk has all the
control flags being strings due to limitation of C macros, but Rust macros
are more versatile so we might be able to take advantage of that and just
pass control flags directly in the future. The
"lib/find_bit_benchmark_rust.rs" is a good example of how this can be
beneficial; it has a `pr_err!` without newline and `pr_cont!` following it
immediately adds one to it; the newline has to be part of the second
message as otherwise printk would treat it as a control flag to commit
immediately. If the control flags are passed on its own, we can then have
continuable message that still ends with a newline.

However Danilo pointed out in [1] that always adding newline automatically
can create issue for developers that need to switch back and worth between
C and Rust:

> I don't think it is a good idea to always add newlines. It might be fine if you
> only do C code or only do Rust code, but if you are switching back and forth, it
> is a horrible inconsistency for muscle memory.

So the newline is made optional if the message is not continuable. It
behaves the same with or without the trailing newline.

Link: https://lore.kernel.org/rust-for-linux/DFJ8XRR2T22T.3R4FQHF50B4P4@kernel.org/ [1]

---
Gary Guo (5):
      rust: print: handle `pr_cont` separately
      rust: print: use `CStr` for __LOG_PREFIX
      rust: print: accept level in `print_macro` instead of expression
      rust: macros: use `syn` for `fmt!` string parsing
      rust: print: add `continuable` as option

 lib/find_bit_benchmark_rust.rs  |   2 +-
 rust/kernel/lib.rs              |   2 +-
 rust/kernel/print.rs            | 217 +++++++++++++++++++++++++---------------
 rust/macros/fmt.rs              |  92 +++++++++--------
 rust/macros/lib.rs              |   4 +-
 rust/macros/module.rs           |   2 +-
 samples/rust/rust_print_main.rs |   4 +-
 scripts/rustdoc_test_gen.rs     |   2 +-
 8 files changed, 194 insertions(+), 131 deletions(-)
---
base-commit: 0d33d21e47d9dc66f91e44da3fc9220c74d93df7
change-id: 20260728-printk-3c0fc5831444

Best regards,
--  
Gary Guo <gary@garyguo.net>

