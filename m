Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022119.outbound.protection.outlook.com [52.101.101.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25153E8695
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Aug 2026 14:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.119
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786371160; cv=fail; b=Vfq+UmWwTMTlec5uF36RMkw0rcEcOWhmTL3f1XbGbbUgxKq6O8zmnZ0/WVzXkMeEnzudL/OM/Oj8iMXx/ii4lRz/cKWWDFmlDBJcM5U+kV9JAyKn1v59F8m5mmwmDgnma568E3S7odH7MDFaDeARdqdluPGuFeOysoFwRk4mvIU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786371160; c=relaxed/simple;
	bh=0FM9zItXxINoQt0V0/7DL9YJ9kpCaDQn5z5Umw1SZxY=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=D7cRSCwvl25NOrpAgG7OUe3f2u8OjTomNMekPOAEoYBxmJhaizhblLBF1rvOha9CS9+v2d7tPln02CfHhAiNJdXfqf/i2jv8QgmwXiZKb+FKhtpSnW2AHppaGjC3B61krqJyOdT2QAkuOY0HphfKsxwzqFCHEbGhEE1vqrYcaJQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=rLi/bgE2; arc=fail smtp.client-ip=52.101.101.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="rLi/bgE2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BCn5pg0DqiTmiPQ6nMsVsP3PH7/6T8Ud0zLu7SLBHeXtQAaUnEFclJ6MTj7WZ10L+KH1yEcmeJN2B+Wt3TRMNLgnzf/DZccy6Boy6m44OT2x94giRxVpruKOhKHTvnpqjNKYRnGK907ZeiVHDIAt4nCL703l1knoZzA9ZsGnJ2f/0rt7DpLDWb5wFjpYYzBoTxNoqD4OktBL9QNFQZmqs52q5AExPj6t5wLg2Q6JW99DluRV/pQClUvz5DTF2js8Q+K2uCI3o1U/vg2oUTBg48PzzqTpTId9ACd6m08j6Mmv9sQBuFhGpVGTzuwLVpBZcUhddN0qEq4amrp5qzQAsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qyHN2H/PHxgQZt1opyRVWIf38ljDToEvG8KSIo30VG8=;
 b=hSt88VY90FAGkJP4eYS8lw4JK1wXHHkAwpBF93k//p3iPMfwRNVOpfiTjaq4RWQkFK4jrzHD8rmUmDesb777rBBoICsYbPAcYl9Upa/3eEqXeM1YnRL/N9gK5SlM+nmHKeW79RuHXj8dLLiuXKm1iGTs8z5OjAsXa5tzU0oe3PyYvil2SveUP14w3qpzAQD5hzF8oWox0MOrIW8n01eMKL9NQVcTT7FOpocoaMf812gUtE5UG7t3REM+++6ua1pcgTosJy2VYOvLbgR/pzJihwzLhxwb11qcZOXLruMQffKIM4S1m3Dld6q4vA2XC3mqvFIBcHxijwx42Xq4NRQvCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qyHN2H/PHxgQZt1opyRVWIf38ljDToEvG8KSIo30VG8=;
 b=rLi/bgE28aBxKwFXchV1EP17SnIh1MUCLYnl+PAcj2HkamgMJUv8fzNlyDVpyVKc3PExCcmKXH3ZWWXlZgW06D1JNgoGsQFlR1H2Q5djVxu1K4iqn2lulAsBimhaoKFAE2L1Ob2FffMAzoIvZ4XscywuQA6lxYg/GeN6dtpZLmI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO0P265MB5239.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:281::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 14:12:32 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%4]) with mapi id 15.21.0292.024; Mon, 10 Aug 2026
 14:12:31 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 10 Aug 2026 15:12:30 +0100
Message-Id: <DKLBQ1FV44TW.WLDHNPDPVBQF@garyguo.net>
To: "FUJITA Tomonori" <tomo@flapping.org>, <a.hindborg@kernel.org>,
 <aliceryhl@google.com>, <arve@android.com>, <boqun@kernel.org>,
 <brauner@kernel.org>, <cmllamas@google.com>, <gary@garyguo.net>,
 <gregkh@linuxfoundation.org>, <ojeda@kernel.org>, <tkjos@android.com>
Cc: <acourbot@nvidia.com>, <anna-maria@linutronix.de>,
 <bjorn3_gh@protonmail.com>, <dakr@kernel.org>,
 <daniel.almeida@collabora.com>, <frederic@kernel.org>,
 <jstultz@google.com>, <lossin@kernel.org>, <lyude@redhat.com>,
 <sboyd@kernel.org>, <tamird@kernel.org>, <tglx@kernel.org>,
 <tmgross@umich.edu>, <work@onurozkan.dev>,
 <rust-for-linux@vger.kernel.org>, "FUJITA Tomonori"
 <fujita.tomonori@gmail.com>
Subject: Re: [PATCH v6 4/7] rust: time: add Delta::to_jiffies_timeout() for
 timeout conversion
From: "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260808062839.1159990-1-tomo@flapping.org>
 <20260808062839.1159990-5-tomo@flapping.org>
In-Reply-To: <20260808062839.1159990-5-tomo@flapping.org>
X-ClientProxiedBy: LO6P123CA0005.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:338::10) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO0P265MB5239:EE_
X-MS-Office365-Filtering-Correlation-Id: 90006ccf-f8e4-4217-0ae7-08def6e96ad7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|7416014|10070799003|56012099006|10067099003|6133799003|4143699003|18002099003|22082099003|921020;
X-Microsoft-Antispam-Message-Info:
	HYD55Cg+4+lV80PYDPjPCiTRw4exfTymKAA3crg8woGRphUGGoFH4wMVR2PL/Y/mko5mR/edPDiUJ3IDeGFA586SgRsYG3CA6+16fl6mf3Mq6ARUy1uP/OBdttGZHLbO7yGhhskDmNBnkRxGcbnkxytXxymVL+sp61Q3tms7n7sq8JW0Ltjv5S68NixFc3oqAF9N8zS25H8mNNcZ1g1fZv0k1MBNDdlmf3PZnezuds5RlMWlXAOKjfvakxfQjNxKPWPZmZDc1Z6RInap2aFi+pQV7GiCidTRz2MgtwGtv5gEPdMjoUEViuNa/lV8l7VtedtTh3BKirR7rpQtzP/SyPZX3wh4hktT0Ia8K09TdifwjPBinmPkUsj01R531G8W2vZRFI/N/wfJhxvTFGmo4vQCTr5Yj/xCdCmKUqqQvNLId2HiztDQOSTLejxYtDrE6vPssLqzyubEs4UT+L9J7t0LjRkSaVNwttAWE9kroAs3l9l7zyZm39FZDiSoJMeaVeSxOgPmP5Y/TNaJcBhgUwy4XQ8L+43zn0GDRy9jESYMjwJ59C+FQqDY9ctOg2LLlP1e3HkJq9C14L4VnlAepMRq42m7Abh5DsOTaikvvKNv0VkK7jSoAyG2fuBYAyETqm7qLovxfV3TkOvUrGcN7D5FY3+5yAvZ6c2T40zaT0g8PxVwlpAErVKHoRo6Nf5F+/0HagoDfwoblHcfKUWVpQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(7416014)(10070799003)(56012099006)(10067099003)(6133799003)(4143699003)(18002099003)(22082099003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OE1pbDhMclNNMDJpSlVpZkQrb2Z0ZzFVV1pzSXlUY0tJTkJ3UjdrVzcxVnpm?=
 =?utf-8?B?UGt1KzNTclVucS9IWVEwdS8yK2p2Tkh0ZkNqOTJJd05sblc0dnM2b1NGd1JR?=
 =?utf-8?B?RHdhQThya01JOUdaUnVZOEU0NmIzU2x5V1Z1YUp1NlpiSGFqcWNjM1laWkFs?=
 =?utf-8?B?UERXazNHWHVaS1RXNzBPMVNjbzI0Smx6dEtidHdFYU12cmlpeitBYlJWOWQw?=
 =?utf-8?B?OTNTVXlsdkpOS2puV1pUbFZ5WGdja29PZ1Vxa2VZbVZWWlF3ZlR1Yzl0OFlx?=
 =?utf-8?B?a1hGVDhFdjVPYjVlOHB4YTBPR2p0aXNpZTF3Ukh6bU95U2hzakYyTVp1S1Fl?=
 =?utf-8?B?WndCbTBYRitLS3lJbTd6dVpQOEx0S3BNQjZyY0dBT2ZKRW1DL2lERGtMTDlZ?=
 =?utf-8?B?Z1psNkxxbmJaMUEzT0REMmNneld1dStCME45Qzg4UEo1RnBIeDBmc2QxazR5?=
 =?utf-8?B?UDFQWjNDK3FKSWNWbjhoc0RpV3c0SE55MGhCb2tBU0RwMlBockRCbUdZTnh5?=
 =?utf-8?B?MEs1cG5qQzBzWngyRGM3MVBueGFtWWVKSHc2NkgxS0RxMVdhTXpMeGRtZGhL?=
 =?utf-8?B?V3Q5TVFyNUlUdDhrVFJsbU93T0VCQ1lCMS9PWmw5aWd4U2NHZ2hodE5ybWNN?=
 =?utf-8?B?K0lPUnYwanhqUWQ3b253ZkJ0bG52K1V3R3doL0V1enVHWS9HQUVBbFFMcVpC?=
 =?utf-8?B?elRGY2E2Y2VFN21ZOFhuWlltT0ZPQ1VTT0FYc1NjcmZtL3F3cTNKM3hHc1Uw?=
 =?utf-8?B?YzhaN29rQXp0MmIyOE0vWit6Q0x0dWlmZHFHMTZ4eXhBSVdQcG93L2x6Lzhk?=
 =?utf-8?B?a3dWL1NvUzBPS1djdDB0SUN3R0V2emNtVnAvZjEzRnhERi8zdmFQa0FYS01T?=
 =?utf-8?B?RVVSbDVENDBIaGVSOVoxWVJuYXhsckdUWDR3RFcxYWRPb2NvMkoxTERlNk04?=
 =?utf-8?B?VjhaS3piRlE1bytuNndOYmZ1TTd1c2ViTGNzK2w4MnVIb3k1aWRpT0ZMTVNY?=
 =?utf-8?B?NVFjRHRPc2h0Z2NTWjZTUWJiekExSE9lbW9weVkvRVNNdVJEYmJLM0VnTzdj?=
 =?utf-8?B?dXVhMEtjWnlhcFdPTDNzWE4zekJNOG1qN1A2RW1WaGhSVktLN2xCN3dLN2sw?=
 =?utf-8?B?ZVQvNHI1dWVQN2EvVkt1cUNDRmY2YUY2Z2dJNlFwQjBHQmFldFZtS09HanBZ?=
 =?utf-8?B?TFBxUDViWWxTdExCOUJSYXdOVXFhT0dSWkV0bGRXeDZwYm1TUUtVL2ZMTEUx?=
 =?utf-8?B?dXJZSWxXNldHRVRYd0VuSDhsSXNNbHFPajc0Z2xabGNXRk5HNEFHc0J2eXJw?=
 =?utf-8?B?QUUzcWtoOEp3aUZINVovUE9Ed0tnODBEMWFJRW85VTh3aEFxeUJReFEzQmVE?=
 =?utf-8?B?RnRTdmVHa0dxaFhaNU1kakxEYlBGSlF3RmtGeC8rNzBzZlVBVUZGTWJFeDk4?=
 =?utf-8?B?ZEJXT2N3R0trL2czdUFIK1pKVmlTeTNmQWhrcXliUEdjTFRvcHdZSlZBdkNJ?=
 =?utf-8?B?R0RGdjRmYmE0bFR4ZDNlTDY0c3Y5c0RCN1VacWl6WkdZWnp0ekZkRTlaU0pZ?=
 =?utf-8?B?MUlmaTJrUGtTMTNKSkhib3FPaTZHbUVUQWhEL3Z2cHZJbDNqZkJuN1J6bmZm?=
 =?utf-8?B?OTZ3VjBJSWt2YXJrQ1lEMzlYZUJ0eDBFZVJGcFI5U3JRSXV3V2RCR0RDSS84?=
 =?utf-8?B?cE1OblVDd01tMkFSQmlYVGJBVnllUyszdkRMQ3FZMUY0N3I0cFpWbnV4SHRi?=
 =?utf-8?B?RUZ6MS95R1JvbjVkYkFDOUJFZEhxbzZEaG8yM2pEUWNnM3lHdFkzK2Q3c2pm?=
 =?utf-8?B?eFNCTFZqMmxqalRzckd2RjMwVk45UlFSMHd1TE1ucGhBeUtrc0JuVVFvNnBq?=
 =?utf-8?B?QjBmNlJTeEtCTXJlSndLRmRWS0NyVlJHbkprRHhtOFcydG9VWFAwS0daVDJr?=
 =?utf-8?B?Q1Y0bVpXQWdEQTlXUFhoMU1odWFydW4zaEpoRU13WnNKZE9wZjVydTRXaEZH?=
 =?utf-8?B?RE94Wm1UQjI5SWoxQ3dGN0RveDBYcUFxc2lIZ2ZGc1Y0UkQzSTRrampmeVo4?=
 =?utf-8?B?QmJwWTlXTU1zSTZlNWhGU1QvaFhtdjBYUVZTS2ttazYvbFBEczFhVWtNOWdk?=
 =?utf-8?B?UGhoaVp6Y2xvQWl0QVdZa2lyY1llQ1Z3Mng1ZTNRdXZEUkVGU1NtaHN5aGJJ?=
 =?utf-8?B?WVlEajhuV0lYNTg4c1FnaWlYMzU2dytGNDBDWk92dUdHMFpRWWZDd2l4aEZH?=
 =?utf-8?B?RHg5ZlRYK0xYMzBPRVJZZ3A4Mm42ekFCNTlyTnIzU09ZK2J0QURJTFNGYUFI?=
 =?utf-8?B?eTAza2JGdk1ibTQxRDFHVVFibHkvTWFNVU1MZVdWemhFT3lkUTM1QT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 90006ccf-f8e4-4217-0ae7-08def6e96ad7
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 14:12:31.7103
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: llnxOpRpjQurstUNAun2EyGSqx4CSJu9/j7X8Ocsjwg7LRWZbQe5RwW+GQOclJKQwDWr+D5WEy1RhEEu+lJRjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB5239

On Sat Aug 8, 2026 at 7:28 AM BST, FUJITA Tomonori wrote:
> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>
> Add Delta<Nsec>::to_jiffies_timeout() conversion that rounds up so the
> resulting timeout is never shorter than the requested span, clamps a
> negative span to an immediate timeout, and saturates an overlong span
> to the kernel's MAX_JIFFY_OFFSET "wait forever" value.
>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> ---
>  rust/kernel/time.rs | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>
> diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
> index af144d251f47..83891dab3aa7 100644
> --- a/rust/kernel/time.rs
> +++ b/rust/kernel/time.rs
> @@ -551,6 +551,27 @@ pub fn as_millis_ceil(self) -> i64 {
>          }
>      }
> =20
> +    /// Convert this span to a [`Delta<Jiffy>`] suitable for use as a ti=
meout.
> +    ///
> +    /// The value is rounded up to the next whole jiffy, so the resultin=
g
> +    /// timeout is never shorter than `self` (as `msecs_to_jiffies()` do=
es).
> +    /// A negative span clamps to zero jiffies (an immediate timeout).
> +    #[inline]
> +    pub fn to_jiffies_timeout(self) -> Delta<Jiffy> {
> +        let msecs =3D self.as_millis_ceil();
> +
> +        // CAST: `msecs` is clamped to `0..=3Dc_uint::MAX`, so it is non=
-negative and
> +        // fits in `c_uint`.
> +        let msecs =3D msecs.clamp(0, i64::from(crate::ffi::c_uint::MAX))=
 as crate::ffi::c_uint;
> +
> +        // SAFETY: `__msecs_to_jiffies()` is always safe to call.
> +        let jiffies =3D unsafe { bindings::__msecs_to_jiffies(msecs) };
> +
> +        // CAST: `__msecs_to_jiffies()` returns a value in `0..=3DMAX_JI=
FFY_OFFSET`, i.e.
> +        // `((LONG_MAX >> 1) - 1)`, which is non-negative and well withi=
n `isize`.
> +        Delta::<Jiffy>::from_jiffies(jiffies as isize)
> +    }

I think it's fine to merge this as is, but I still want this to be simplifi=
ed to
not have two divisions eventually.

Something like=20

    fn to_jiffies(self) -> Delta<Jiffy> {
        // implement using nsecs_to_jiffies
    }

    fn to_jiffies_ceil(self) -> Delta<Jiffy> {
        // implement with to_jiffies
    }

    fn to_jiffies_timeout(self) -> Delta<Jiffy> {
        // implement with to_jiffies_timeout and clamp to 0
    }

Perhaps?

Best,
Gary


> +
>      /// Return `self % dividend` where `dividend` is in nanoseconds.
>      ///
>      /// The kernel doesn't have any emulation for `s64 % s64` on 32 bit =
platforms, so this is


