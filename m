Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020102.outbound.protection.outlook.com [52.101.195.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA04E2BF006;
	Tue, 28 Apr 2026 11:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.102
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777376586; cv=fail; b=XExU/Fjkuqknx1ieI9PDctQae8sKzo5MuEwwx8hHEZ9VQY6K0RbUy0IASBNVqDcIiHhlbiKs25umQC9wTDwc6EFz3n/+iLV74H1Y5bWHeRxpAbbcW48Ma1rvD2Otya7qm33gmAPHM4sOTOEH+bGpNzN3PK1uAvts3YPK7Vp/0Dc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777376586; c=relaxed/simple;
	bh=R8bNgp+dvVWleMluGOh0lBo+pQ+QnMfNv7dB02CIzJk=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=dvXRQ0sgahejRM3nMl++rl8kW6xmYJ4xOhrIEhHZFrV66Db4jtukla0XrzgL5u2nFQV8mFZpptLJ0P60DaYem+lLy33TkSZSRBZzuT6kSFPgdsnj/9sCRQtN/fks4gVah1ukG6fsMA2QtPETEeh3iUgk5MiQBFf8m/2JEbgEfo4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=Q47H9BVJ; arc=fail smtp.client-ip=52.101.195.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="Q47H9BVJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p7DFVV2KLk/SzbLPXH12Aj/JvDv0l6vaa38ivLBIRgG1ZZmCJfuRqN57lbwkIcAFU8a/ZALPL29LR6w/mqBZUTD6XoY8CLBuVHBXu8ZrrIAaiDDGQlMyTUKQwepi5QFvch8h2rWlHkeBjftsRkuY8+IUPF7nslBRRhxtqs9Jac2cZDIoHfz1Y57nRU9oghA9MIW+9QPHVStTmrNkJan8SWdLslrKRFGzpn+gGAPFkEXcMluOeP2Pld8DtNWeEvRQZfF157xvuOSWyr0DcyuoCU/9k4rCnkGulrsZHGTa7d7bNFTHKZU0OCztz71ORbvbBfsspg8tgN/X3q2+UoaDMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xIdXCO2GCy8Ak3UCNtw5AVlXk8snQ5pXuicxfaQjdss=;
 b=lU1X5s/PgFm6hx9DKMQ8Ca/esUQ4aoQtc1P3ehoD55knkRaKTjPVK1Ax+/BOw/G8o9kIj1Vxg1gCkB5dyDY75eGrfAfqSVcJc7em5CEGpbuJxWTvdx0lqNqEmb9yA4PDD8PYmvnJZQAsnufthpZiWCiKJw1HfoVjN6vxjwPxawYVgQQw0UOeYxT2AhI3gCxsasJNgfR4tpdsN6SmUvXcoSDNWcjP/ND4Ct5lCnIyDRp89kliN7sjfUcnb12rrAiojl1uh8clvWqtWYul2SYh+O4u6YZhrpWNAB+G8/QFNYrfpmcSYrRJ6NIb6yjIQ8m6TXfCKgRz7g74ZWD80/pWkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xIdXCO2GCy8Ak3UCNtw5AVlXk8snQ5pXuicxfaQjdss=;
 b=Q47H9BVJPSdPtw1Zv9ds1UuMFEgaAqPDgvuTq7r2PRrRIRQWLVaFk8ErISF8nv0HDWWOzVadqpkVWQZQ9QPTy2rLsRqcN04XyS9KMn6lqi1jMeWeAQvnuZFKDRPq5wZGzU12o9OkHDtMRjjZn6kivQdYMlpm4yQeQq1bgm69XDk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWXP265MB2791.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:89::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Tue, 28 Apr
 2026 11:43:01 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9846.025; Tue, 28 Apr 2026
 11:43:00 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 28 Apr 2026 12:42:59 +0100
Message-Id: <DI4REWE5KN40.34QG65YUYOJPZ@garyguo.net>
From: "Gary Guo" <gary@garyguo.net>
To: =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Cc: <ojeda@kernel.org>, <boqun@kernel.org>, <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, <lossin@kernel.org>, <a.hindborg@kernel.org>,
 <aliceryhl@google.com>, <tmgross@umich.edu>, <dakr@kernel.org>,
 <peterz@infradead.org>, <fujita.tomonori@gmail.com>, <tamird@kernel.org>
Subject: Re: [PATCH v1 1/1] rust: add Work::disable_sync
X-Mailer: aerc 0.21.0
References: <20260428104459.174602-1-work@onurozkan.dev>
 <20260428104459.174602-2-work@onurozkan.dev>
In-Reply-To: <20260428104459.174602-2-work@onurozkan.dev>
X-ClientProxiedBy: LO4P265CA0132.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c6::13) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWXP265MB2791:EE_
X-MS-Office365-Filtering-Correlation-Id: d0f07179-3c95-4220-912e-08dea51b4c65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|7416014|376014|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	PA1hp/TqNCDc2cVTi8qTQax68mbF7Z6VSRBSYhPSK0+He5/TK6W9JUYSJkoBlpMcCAm0cnfcO09VsIE+kE1PbshaLN11o4s7e8beon6hxhTAM75thQe8eJ5MvT7AipuHnH0ehSICkS8TDatdP06+K1JoZI/SUSNb/wA4xzWu209GGzANfy0HBS+iVNqLV5RzStPa8mj6XDz8ojcU/DTD3l7/IzCHeAtcaNyIk52R2LMkjPw2UuxlAfnpjOu3XHMa1gp3t/f5hbLrO1VOPPUIMJOyhds3JZUwdWIgPuF8/F/4JVWJw5sd936XnASsCicZ3o6XZOLU3tNOoscBuFK+ayBxVf5Mq2c4ybIlOiqXMJnkzMtv5BTDqUesMBT7YRO4wcOG2tiRmvEKqN9rRDBKeId6M334tZiP1z9tQ5ZD9JXhRLJVmq6rZzj0oRRcPqLwSrBzgs7RR309KLj2lz5xv3CB/G9xJZmjYj/eAs4NSMT/K345tF4Q17jvWvB9UXyf6fHKJPDftED14RvQjzwfMwmq07Y8UvG/EPPt7qn7ZnD5OdPItWaXwhi6964QEFpKzYc3BDjNmksRXASj3hrNuk0tec5/bWVJDxVHvLNDipSiJgaSBLPidjQxii16zSGKF9rtMHFw8Jkr5SOzTS2qSY42cmmPJ52XNdnJBs379yQYq6kJ4T7nxB775MzQB6FfwOtCwbeF4XYy36WRjWyqdOgXBldYRknt7Qzgv8rKfn8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(7416014)(376014)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d0RFNG96SkZQSU82LzVxeEp3TXlnUkk3OHRDd3czM1Nxa01vODh6aVlxSnZ5?=
 =?utf-8?B?ejU3SmVFOFArYm9qckFsTlpnUWMwQkhwUVhqcG1zL1F2VGlGRStRY1RNWkFn?=
 =?utf-8?B?NFVzdWE0MVYzaUdWeUs1cEVXN0EzYngwSVpEeGQ3R1FDSENFRG5hTlpNUGg2?=
 =?utf-8?B?UUlmNnBCeVdoNGVoOXdOWDlQb0dPa0hHWFg1TzZhcktLd0M5M0NibkJTNW14?=
 =?utf-8?B?STZnaHRETnVkM0xoOFZuV2R0azdzN3dYdTM5amlzT1JPY0RuSEN2K2doZ0RM?=
 =?utf-8?B?eWlsZGZNTnlBNVJmZHNLSXN5YlZBWkZxRHFuYlcydjVwZEZRZTgyeWFDYmhT?=
 =?utf-8?B?RlZCazc1MUk1MStRVVpnQitBaldkUnZZaDVkL1kvUkZpdGtiSXNFSmlpcitw?=
 =?utf-8?B?M1RiNFBGUlUwL0NYNzZqV2p5Zmg0MEJlRHg0Sno4bWJHSjF1UmxSdStQL0Fw?=
 =?utf-8?B?S2dXc0RFUWUyYm9vMklmWm1Odmk2NGdoRmlLUUl6ZUlBTU9TaHpPRFNzSWxI?=
 =?utf-8?B?ZnpNb0lQS0dRMW10MkxDb0dneHpFd3YrMDFTckZhOHdZRUZBUWd5cDk5NStm?=
 =?utf-8?B?M1BEU0dhcmxxSFozQjV4bUZSaVlOdDBTTmhkT3hzcWFRSWttQlNUMUh5MUNN?=
 =?utf-8?B?VlFLUENXRVduS1ZrZ1M2ZmxJQmYxN25iY0N0ZHMrRkFHRXNyWVFoZElEK3dD?=
 =?utf-8?B?bFFvL2ZDM3NnUmYvT25SakNOMzZQN0oxVTAzaUszOE14eDl6TGlBN3FVTjFW?=
 =?utf-8?B?MDR2SFM1bThMSjlha0NLa0NyeVNQVndaby9sS2R6YkJFVzZGZ3ZNLzBnSk9u?=
 =?utf-8?B?dHZLaXNCcWd3eFBQR3JUYk5RbzJpYU9ZQlNsSUs4TXRJVWFLdURoeXN3a3hR?=
 =?utf-8?B?VkdpVFQ3VFYzRFBrODFYb2pKd3h3YnVUKzVJSlE5M084L3pIQ2orU1RMNnNQ?=
 =?utf-8?B?QjFNQ0VaQk5kYlNGQmZBNys5RTNvK2QxZEdIS1BLRnRUMWQyYnpWbmN3QzZI?=
 =?utf-8?B?NWJ6UjhScVNTTndzbHljQXl3cmdGSGhqY0NSMUZhdGIybEwzMFlhZkZkSlFo?=
 =?utf-8?B?QlViRHNnSHBDV3I0QmM5eW15a1VjcUV2UlN5bmgwUVJIR25UN1FNVFpmbTBM?=
 =?utf-8?B?UEJmM2hic2VtK2lGeFB3ZW03UUxZZVExaWYzUG8yTENsR2cxOGZaMW1Iekxy?=
 =?utf-8?B?MVJXVlZhVlNKZ1R3TWFvNUtZS0JuQXpuSW0yeUxZMWdmSW1oakVOZG9aZnJD?=
 =?utf-8?B?SHlmYnBuTU10T2lybjNBL2IrT1E4dVZhSlMrWitkV2hnc09kSDIvWTlza0RE?=
 =?utf-8?B?UjR2ZkJHUGtDUGpaczVSSkNYVDIzanZCbHpZUWlZMTNTeWNlYW9va0J0a0N6?=
 =?utf-8?B?ZWZZeHUxdS8rUU5NdUR0bVM5YTQ1Myt4SGRBbWk4NERjcC8wcHUvYnFBN0VX?=
 =?utf-8?B?V1NGMW1HUElUNVZyaWd2OTQ0eHBkWVlqTk1MQmhxQnpXZkR6ZWcwZEdBUysy?=
 =?utf-8?B?T0pNa3ZLWGlnQnVsM2EyOHhjd2E3L1F1VTkzdE9HUno2TGhpcmVQdFFFYU01?=
 =?utf-8?B?Mk1zdkVFQnRUa1MzSFV0aDhVRGdtYWNJMHVWQ25HcUh4MmpJQkRyRFhjcWI4?=
 =?utf-8?B?MGc4bDdhSjFTSHRxZXZMaXo0NlZsQXlDN3BvWTlHUEJDMlZvKzE0REpvTXpu?=
 =?utf-8?B?MXhDaGE2N080M1d5ZXJobWR1eDc3Rk54MXdiS2NSQkxwd2FKZlNIMEsxWnl2?=
 =?utf-8?B?dUhha2J3V056NEdBMHAwUkFIREJpeXI3bHViYmd3Zkp5M0lia3VhMS9nczls?=
 =?utf-8?B?d0NwMDRiWWZqNXZ5R2ZnU3AvZ0lpUFh1dnpEM2VyTUVpN1pFaThDdUc2U3FS?=
 =?utf-8?B?Q2ZvYVJBa29tb09XMnNsbGhIVnEwTnd2MDI3dVBnczYxand3T3hvVVdsTHht?=
 =?utf-8?B?Nmc2K0R0ZGcwS3dJTStjN2RPb3l1YUFYdm95VFN1SlRrVFNCVkJJRUhGdnBY?=
 =?utf-8?B?Yk1tWXVJdnpSOVpYSXVaNy9EWThNblljRnhrVWc0V2xURkx5STA5M3NoVy8z?=
 =?utf-8?B?Zmt1R0FhU2hqNGxZMmw5L1FpbG5Dci9YVnN1RU05bzZpWVpQQzhBYjJTaEtP?=
 =?utf-8?B?aXF3dGNGbm5VaDZuY3dKWjJGSnI4dXVzS2lIU1ZBSlJnQkFycjl5QUNVb2NR?=
 =?utf-8?B?VmphWE1KajNEQzdxVHlobXJveTY2WWY1K1F2cGdSKzFJcjY5TkJvbE5vWmhR?=
 =?utf-8?B?MHpPTVlpVzlFRmx1b0lKNjZZNWNOckNUbDB2bEs0ODNCTmpLTWJhb0JIeFZs?=
 =?utf-8?B?dW9pY0dpalZKMXBwcUFnUDVpQ21WL0RMSWtPYjFNbmlwTUg1SDJPdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: d0f07179-3c95-4220-912e-08dea51b4c65
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 11:42:59.9957
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HZsBaDRbthArhARVgLyGvUsVphgSMsIU5uHU+/LP5NWPM1wR/YMRKaJiyL3hi657Ypfpp8ysdvCR4CYCusrdkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB2791

On Tue Apr 28, 2026 at 11:44 AM BST, Onur =C3=96zkan wrote:
> Adds Work::disable_sync() as a safe wrapper for disable_work_sync().
>
> Drivers can use this during teardown to stop new queueing and wait for
> queued or running work to finish before dropping related resources.
>
> Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>
> ---
>  rust/kernel/workqueue.rs | 102 +++++++++++++++++++++++++++++----------
>  1 file changed, 76 insertions(+), 26 deletions(-)
>
> diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
> index 7e253b6f299c..443fc84dbeeb 100644
> --- a/rust/kernel/workqueue.rs
> +++ b/rust/kernel/workqueue.rs
> @@ -442,21 +442,48 @@ pub unsafe trait RawDelayedWorkItem<const ID: u64>:=
 RawWorkItem<ID> {}
>  ///
>  /// # Safety
>  ///
> -/// Implementers must ensure that [`__enqueue`] uses a `work_struct` ini=
tialized with the [`run`]
> -/// method of this trait as the function pointer.
> -///
> -/// [`__enqueue`]: RawWorkItem::__enqueue
> -/// [`run`]: WorkItemPointer::run
> -pub unsafe trait WorkItemPointer<const ID: u64>: RawWorkItem<ID> {
> +/// Implementers must ensure that [`WorkItemPointer::from_raw_work`] reb=
uilds the exact ownership
> +/// transferred by a successful [`RawWorkItem::__enqueue`] call.
> +pub unsafe trait WorkItemPointer<const ID: u64>: RawWorkItem<ID> + Sized=
 {
> +    /// The work item type containing the embedded `work_struct`.
> +    type Item: WorkItem<ID, Pointer =3D Self> + ?Sized;
> +
> +    /// Rebuild this work item's pointer from its embedded `work_struct`=
.
> +    ///
> +    /// # Safety
> +    ///
> +    /// The provided `work_struct` pointer must originate from a previou=
s call to
> +    /// [`RawWorkItem::__enqueue`] where the `queue_work_on` closure ret=
urned true
> +    /// and the pointer must still be valid.
> +    unsafe fn from_raw_work(ptr: *mut bindings::work_struct) -> Self;
> +
>      /// Run this work item.
>      ///
>      /// # Safety
>      ///
> -    /// The provided `work_struct` pointer must originate from a previou=
s call to [`__enqueue`]
> -    /// where the `queue_work_on` closure returned true, and the pointer=
 must still be valid.
> +    /// The provided `work_struct` pointer must satisfy the same require=
ments as
> +    /// [`WorkItemPointer::from_raw_work`].
> +    #[inline]
> +    unsafe extern "C" fn run(ptr: *mut bindings::work_struct) {
> +        <Self::Item as WorkItem<ID>>::run(
> +            // SAFETY: The requirements for `run` are exactly those of `=
from_raw_work`.
> +            unsafe { Self::from_raw_work(ptr) },
> +        );
> +    }
> +
> +    /// Reclaim a previously enqueued work item that will no longer run.
> +    ///
> +    /// # Safety
>      ///
> -    /// [`__enqueue`]: RawWorkItem::__enqueue
> -    unsafe extern "C" fn run(ptr: *mut bindings::work_struct);
> +    /// The provided `work_struct` pointer must satisfy the same require=
ments as
> +    /// [`WorkItemPointer::from_raw_work`].
> +    #[inline]
> +    unsafe fn cancel(ptr: *mut bindings::work_struct) {
> +        drop(
> +            // SAFETY: The requirements for `cancel` are exactly those o=
f `from_raw_work`.
> +            unsafe { Self::from_raw_work(ptr) },
> +        );
> +    }
>  }
> =20
>  /// Defines the method that should be called when this work item is exec=
uted.
> @@ -537,6 +564,29 @@ pub unsafe fn raw_get(ptr: *const Self) -> *mut bind=
ings::work_struct {
>          // the compiler does not complain that the `work` field is unuse=
d.
>          unsafe { Opaque::cast_into(core::ptr::addr_of!((*ptr).work)) }
>      }
> +
> +    /// Disables this work item and waits for queued/running executions =
to finish.
> +    ///
> +    /// # Note
> +    ///
> +    /// Should be called from a sleepable context if the work was last q=
ueued on a non-BH
> +    /// workqueue.
> +    #[inline]
> +    pub fn disable_sync(&self)
> +    where
> +        T: WorkItem<ID>,
> +    {
> +        let ptr: *const Self =3D self;
> +        // SAFETY: `self` points to a valid initialized work.
> +        let raw_work =3D unsafe { Self::raw_get(ptr) };
> +        // SAFETY: `raw_work` is a valid embedded `work_struct`.
> +        if unsafe { bindings::disable_work_sync(raw_work) } {
> +            // SAFETY: A `true` return means the work was pending and go=
t canceled, so the queued
> +            // ownership transfer performed by `__enqueue` must be recla=
imed here and the work
> +            // item will not subsequently run.
> +            unsafe { T::Pointer::cancel(raw_work) };

I think have an explicit drop is clearer and remove the need of additional
function in the trait.

    // SAFETY: A `true` return means the work was pending and got canceled,=
 so the queued
    // ownership transfer performed by `__enqueue` is reclaimed here.
    drop(unsafe { T::Pointer::from_raw_work(ptr) })

The `cancel` name is confusing because this is called *after* the work has
already been cancelled.

Best,
Gary

> +        }
> +    }
>  }
> =20
>  /// Declares that a type contains a [`Work<T, ID>`].
> @@ -817,22 +867,22 @@ unsafe fn work_container_of(
>  //   - `Work::new` makes sure that `T::Pointer::run` is passed to `init_=
work_with_key`.
>  //   - Finally `Work` and `RawWorkItem` guarantee that the correct `Work=
` field
>  //     will be used because of the ID const generic bound. This makes su=
re that `T::raw_get_work`
> -//     uses the correct offset for the `Work` field, and `Work::new` pic=
ks the correct
> -//     implementation of `WorkItemPointer` for `Arc<T>`.
> +//     uses the correct offset for the `Work` field, and `T::Pointer::fr=
om_raw_work` rebuilds the
> +//     correct pointer type for `Arc<T>`.
>  unsafe impl<T, const ID: u64> WorkItemPointer<ID> for Arc<T>
>  where
>      T: WorkItem<ID, Pointer =3D Self>,
>      T: HasWork<T, ID>,
>  {
> -    unsafe extern "C" fn run(ptr: *mut bindings::work_struct) {
> +    type Item =3D T;
> +
> +    unsafe fn from_raw_work(ptr: *mut bindings::work_struct) -> Self {
>          // The `__enqueue` method always uses a `work_struct` stored in =
a `Work<T, ID>`.
>          let ptr =3D ptr.cast::<Work<T, ID>>();
>          // SAFETY: This computes the pointer that `__enqueue` got from `=
Arc::into_raw`.
>          let ptr =3D unsafe { T::work_container_of(ptr) };
>          // SAFETY: This pointer comes from `Arc::into_raw` and we've bee=
n given back ownership.
> -        let arc =3D unsafe { Arc::from_raw(ptr) };
> -
> -        T::run(arc)
> +        unsafe { Arc::from_raw(ptr) }
>      }
>  }
> =20
> @@ -887,7 +937,9 @@ unsafe impl<T, const ID: u64> WorkItemPointer<ID> for=
 Pin<KBox<T>>
>      T: WorkItem<ID, Pointer =3D Self>,
>      T: HasWork<T, ID>,
>  {
> -    unsafe extern "C" fn run(ptr: *mut bindings::work_struct) {
> +    type Item =3D T;
> +
> +    unsafe fn from_raw_work(ptr: *mut bindings::work_struct) -> Self {
>          // The `__enqueue` method always uses a `work_struct` stored in =
a `Work<T, ID>`.
>          let ptr =3D ptr.cast::<Work<T, ID>>();
>          // SAFETY: This computes the pointer that `__enqueue` got from `=
Arc::into_raw`.
> @@ -895,9 +947,7 @@ unsafe impl<T, const ID: u64> WorkItemPointer<ID> for=
 Pin<KBox<T>>
>          // SAFETY: This pointer comes from `Arc::into_raw` and we've bee=
n given back ownership.
>          let boxed =3D unsafe { KBox::from_raw(ptr) };
>          // SAFETY: The box was already pinned when it was enqueued.
> -        let pinned =3D unsafe { Pin::new_unchecked(boxed) };
> -
> -        T::run(pinned)
> +        unsafe { Pin::new_unchecked(boxed) }
>      }
>  }
> =20
> @@ -950,15 +1000,17 @@ unsafe impl<T, const ID: u64> RawDelayedWorkItem<I=
D> for Pin<KBox<T>>
>  //   - `Work::new` makes sure that `T::Pointer::run` is passed to `init_=
work_with_key`.
>  //   - Finally `Work` and `RawWorkItem` guarantee that the correct `Work=
` field
>  //     will be used because of the ID const generic bound. This makes su=
re that `T::raw_get_work`
> -//     uses the correct offset for the `Work` field, and `Work::new` pic=
ks the correct
> -//     implementation of `WorkItemPointer` for `ARef<T>`.
> +//     uses the correct offset for the `Work` field, and `T::Pointer::fr=
om_raw_work` rebuilds the
> +//     correct pointer type for `ARef<T>`.
>  unsafe impl<T, const ID: u64> WorkItemPointer<ID> for ARef<T>
>  where
>      T: AlwaysRefCounted,
>      T: WorkItem<ID, Pointer =3D Self>,
>      T: HasWork<T, ID>,
>  {
> -    unsafe extern "C" fn run(ptr: *mut bindings::work_struct) {
> +    type Item =3D T;
> +
> +    unsafe fn from_raw_work(ptr: *mut bindings::work_struct) -> Self {
>          // The `__enqueue` method always uses a `work_struct` stored in =
a `Work<T, ID>`.
>          let ptr =3D ptr.cast::<Work<T, ID>>();
> =20
> @@ -972,9 +1024,7 @@ unsafe impl<T, const ID: u64> WorkItemPointer<ID> fo=
r ARef<T>
> =20
>          // SAFETY: This pointer comes from `ARef::into_raw` and we've be=
en given
>          // back ownership.
> -        let aref =3D unsafe { ARef::from_raw(ptr) };
> -
> -        T::run(aref)
> +        unsafe { ARef::from_raw(ptr) }
>      }
>  }
> =20

