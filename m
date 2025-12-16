Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021075.outbound.protection.outlook.com [52.101.95.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2F9534A3DF;
	Tue, 16 Dec 2025 12:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765887625; cv=fail; b=mYrRbOgmfuneq2iNhncDRHxhenDv+/1ndqj8eYUkE9PJWD9MsBu1F3hJCeuj6cT3xetHOoYzm2MQgbIgatbWzYnnx/OTk4rjTu5bGOSqVKZaT0EioRUnltdTQk9H/YFbqiG4HBXbcgRh8Qw+aa3IbtkMd1yllhtDjCvPmzjrp8c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765887625; c=relaxed/simple;
	bh=BOnMV0IxZ+Lnz1wOfHKTK9H/dHQtPYekshwDSGv6Xmc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IIRaHIp/VKqjNMY16Ppo3KMjwiO/gQ5IlJamp9vQxI2ce8LFwsCU8U8wOocvwvUmYwfnpSyrkIvwZTwRGiJEavXe9+xMEby0ljMnvUWWtRfd/JRbuFUiwJdyyy99q1b/clLBZgx3PE7+fqV3uV65raM5T2oelSNj8ANBHpIuY5Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=Mh12KY7Z; arc=fail smtp.client-ip=52.101.95.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="Mh12KY7Z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w+AlaDRyok8TFq1yLMHqIJ+l75KspM7H+PRcXVc32vxv6OYmp5V2jr8uyITkIEiTqzt0KzlOzUcSBiCgN4cN+hN0ZMg/d7e8L3ieDmQ49cwqWL/+6JU7DJqguWPfDj7ahct7dkE3f3iV9kGQkrqqZ5By9XJ/fTwnNfNxZbs8X7VpvbkBdV9tGBuyM244cmN39SvqL/WQ7DYdCe+v96ZQalJg/SlCqcq9fUaabS74YDhRrFw45DlTrWlUr+ufUenBsSpZiTyj2pxNvTYmPtWr7x7mdq8YvbSlkQJqJRoGvbzoqhUquHS6wOFPQdbOLU/wSoOQ0LUVJdMqt2MYRllIZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WTajY3s11ucuJpgRU0VtFbGWxPFgjGYRctBaw1GfG3Q=;
 b=Y93RNGqkOs2+m9vc+eGTcaEZoXHActwmqzYxhEERcMxa9ZymOBbkdk0cdH/N/IJSFKd61nfyc5C14i74C/SRh3LNhpF4DUXpZZEzcTRKA7W9uAB0CTCYAArBR4mSYbe6qfeuWiWAfBd4CoDqnUwGSoZ4s4/YIdAFj6MrCF54ulWDkfQApwlpcpMx4loVSnMF/qWjCzZYtFAd66GyCjlVZ7OX9gg30gUq3kkw1hxPLu0HHC4KaTOSI3pyYDlrSK/i+gzvMk3zbJlItjMfWDNpN+vWT3oD/UcS8ofrBkbFiTKKiCAITlF6thSpOZVdbmDtIpOdvnlvsiZd4l3pad3+oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WTajY3s11ucuJpgRU0VtFbGWxPFgjGYRctBaw1GfG3Q=;
 b=Mh12KY7ZoxgysPbetILGDk6AR8Q26MsWNjfe1zCaddpsTrxH1ghWsCYYg4P2Uisl3atieiDvSNrCX5MrPZfK3xpjiTjdQEWUDidtfegKzlzSPwXO1fhOigr8glT5aGbZHU8gmeUGSX/Ht0Cx/X/A+GroNg7wLnX+YdoxTNmWK/c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from CWLP265MB5186.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:15f::14)
 by LOYP265MB2415.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:116::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 12:20:16 +0000
Received: from CWLP265MB5186.GBRP265.PROD.OUTLOOK.COM
 ([fe80::c17:159b:10ec:af4c]) by CWLP265MB5186.GBRP265.PROD.OUTLOOK.COM
 ([fe80::c17:159b:10ec:af4c%7]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 12:20:16 +0000
Date: Tue, 16 Dec 2025 12:20:14 +0000
From: Gary Guo <gary@garyguo.net>
To: Lyude Paul <lyude@redhat.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas
 Gleixner <tglx@linutronix.de>, Boqun Feng <boqun.feng@gmail.com>, Daniel
 Almeida <daniel.almeida@collabora.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, =?UTF-8?B?QmrDtnJu?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas
 Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor
 Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Andrew
 Morton <akpm@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Waiman Long
 <longman@redhat.com>
Subject: Re: [PATCH v16 09/17] rust: sync: Add SpinLockIrq
Message-ID: <20251216122014.315b471d.gary@garyguo.net>
In-Reply-To: <20251215175806.102713-10-lyude@redhat.com>
References: <20251215175806.102713-1-lyude@redhat.com>
	<20251215175806.102713-10-lyude@redhat.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0503.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::10) To CWLP265MB5186.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:15f::14)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP265MB5186:EE_|LOYP265MB2415:EE_
X-MS-Office365-Filtering-Correlation-Id: 61aaef85-8473-4302-f3ff-08de3c9d78c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|7416014|10070799003|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IIwFTHRtvintDn7L6pkcBehS3Mig7QdphJCofAlvIrjfSL+hoD7XqnpwzDc4?=
 =?us-ascii?Q?lmftZcuNoFgRzqTbGgvAYQZp8xrAlpUS7t5Txwyknhq3NbEFlXxFU/Cif1HZ?=
 =?us-ascii?Q?z67H0V6KL35lmkg7EQiAhEmwfWoCNzMq0rFcVwOVazz0fXphS6mEY/eTgHNQ?=
 =?us-ascii?Q?d53syoOfGa1++MeLIaGHyB2IwLzhMgsPQM8ZC1d+Jb9OSXdeJJeSnwyKrF3k?=
 =?us-ascii?Q?MwTRUnkAlVYbwAS/fwYOPNA4IyueWceUgO9pSnujHpSFljR2/cHWEi1Z3W25?=
 =?us-ascii?Q?zLEw/UM+Y2WMYCujN/6+Y0LWgqLp8CL0JT5/go8I50YiPo0airxEVi0CJ1sN?=
 =?us-ascii?Q?dPiaTBL0M8bjBaeywQl78nO3nqROsXExYmflPOCGVWPzf3vKyXy5XnUjBvYE?=
 =?us-ascii?Q?T8ZNA7jwkELRf/ot3mBKkD6oY7sY4ZQYtmNwkdrsJZJopx7uHj2iBZ4UH9AU?=
 =?us-ascii?Q?XGsGmuWlc/IToX5T0DWlx7HznPwkLUH1cAlNf8ceovpk6NipP8c6zC0im8QL?=
 =?us-ascii?Q?T8lqnfnYGEMWMa+uh7tgp4y4x3g/qnfYPL/j3HFWe0OYwBtk1bXjasr9y5ut?=
 =?us-ascii?Q?a+1FqWJnV3cGPg+HJ3ixs1LNkmiq7n3jybi9WLN46wiRG8aAJ/z8ggsjBeqx?=
 =?us-ascii?Q?SzzVCSaFbxSq3cyViFwJjmygUyyOMl5F19C7b90bNKX5eVUZjO3a/K2X99qw?=
 =?us-ascii?Q?E4gRPSFc1nQDxQdWRj4JVAyPX5wN1Ox9TP9hTNNojUGTpAj1sFMNGBI4EQD9?=
 =?us-ascii?Q?p9or2Zjd3HK1vynnJ7Sdv/nK2VTs91Ds5soU+ScsVWx82JLXsWY4QVxIaAUr?=
 =?us-ascii?Q?zLIwPJprF0hG5Qc7jqttTPCPt/c+OANZmsRh8f+lZ26Ft6UTNsOt87lvz30m?=
 =?us-ascii?Q?92z0WwVgLCn53PW+bSUWycgEUncbp21EIiv0vAMAztJl2AOzI1mdv1VbbuX9?=
 =?us-ascii?Q?SkZlswSzyLI/z1EZa1TCplkUspMp/5UK1OUCJ8/1FQg0AjcrUIfDJDr/kM30?=
 =?us-ascii?Q?wjdUP98oVK81l0+WUscU4U1MXbFIWE2lj4Rzfr/ScD+6aHj559E5jm7i+s+k?=
 =?us-ascii?Q?hl1jhm3aM3h+3dg2qiBOKoBWpA6MoHTcLI3rjnAws8C5Ry3imP1Jqa4/CzQz?=
 =?us-ascii?Q?tzD23YZgCwybbCDTiU40t421eLYqOcAJzW5H9gMVp95B1N9j3GE9O4xpllFt?=
 =?us-ascii?Q?LTfwf9mjiMFxRT9zbigCRB7H8HfUcN8yvYlL9YWVY8isa76CRpPP5rqBLC7r?=
 =?us-ascii?Q?uWyiHR8sKehCWGAvqt7EWmVG+w+qkonwX0EhnxtQTF+nmo+xn7eXyIsLfoWY?=
 =?us-ascii?Q?MzwAuZg+dI57m607/uiqeeScZvOsG4slXtuuwZvy4BMWUoU4m6bcB/Nugn49?=
 =?us-ascii?Q?djZGX2T0CGjYeNLGRuW9CD7dnLQg33vpHtAS4dSWOtcCrnQpuID5hecqmpEU?=
 =?us-ascii?Q?UyrxpjqHO1JqPE8mr8FvJsHlup5uTT3h?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP265MB5186.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(10070799003)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AyURsv56QgUoRMsjDOy96s0683cW1xzCpcDH2spuOw1OwY5+AViYEkFYUN3U?=
 =?us-ascii?Q?oAki3PGceItRh8FDzVzVVpmT/dqU/iTqiLopkmA/tdHHw6AjEDvly/kqf7tB?=
 =?us-ascii?Q?JYybJO1TG7zTJdW5hK24GdA7AhzMcNkbaEXQ7C4oX2VMI4U6+4PhQ1tMPcMT?=
 =?us-ascii?Q?cakxrb3+OWMP2/U6kUDsOkdJrjotjcj8pSqRvuhp/K0WfcLpaJgmyOOD4Hmc?=
 =?us-ascii?Q?s1fxe/SgAAhPFh+5SRwsN+OGkeZ0PLfRTDSRe9MocWXhSkJYtc7n/c9IayOl?=
 =?us-ascii?Q?oY7zl05OTXjZMw0lOOezxB1yXoP1sV0WOY08OtlCr5RBgvhLfJyqY67ymX8d?=
 =?us-ascii?Q?++ui10OMqIcxjn0GWetHhUPbvZ/Yu/0fj+WKDp1mkVLpUK2a5zJk1+yahxU4?=
 =?us-ascii?Q?2lcXWdpuIlN4EGRT2YTq3AAS1zZqXTD5+ommsS7M8IdjoHQOO3gj4gYUkuJk?=
 =?us-ascii?Q?2b9ySUEAiuJKqBrCOwZl7Pe3PzVOKlHPf7yZ6WYcyy/gIXa1CWfOVmpcbPa8?=
 =?us-ascii?Q?G6jeKmQpprq4FVcUQL8CQsLkHm+c+AnCnBg7LJSIm292u8xuppsojPoyjQjO?=
 =?us-ascii?Q?o+xoK/9UDe4uhPX7hV6EvJ/htJ++Gq+pKPhXDv995AZptcKlTHo6cuLMsq95?=
 =?us-ascii?Q?ZetLpjuQ1ZRctXNkCnfMKuQHC6KO8borEHMhA9FWGAoJ6zfaHjEnBUZktp+h?=
 =?us-ascii?Q?YpNOncj3Ql/HGgNaGYMLSqwgclFFRUDxabDK0XYYZJ9kmHdRzODc8E3Pf5M5?=
 =?us-ascii?Q?17S0IHluibUiQCeLAV57ZUpdyBcmsvdtCywpgcKWkNaFmaZ8ZMhQhVviqVVp?=
 =?us-ascii?Q?bi/eisxs0ML4maDWCcOA1Yz/iyT6PkqBC8k4+ybvSEhteJksz3FT2XlDt6Q+?=
 =?us-ascii?Q?FoPnJtddhrQ1U5UTEZ9yvgLuugpJu4T/tXt5OEGc3BCgWXKllS0JUx3xrMRK?=
 =?us-ascii?Q?wyf+rW6alXsDlJO3PF3CWjjIAHckMpVJpYsE0gIGkm4QZMiFUb36zSi32Uu5?=
 =?us-ascii?Q?arKcQlA9ai/t/9nYTIV+snrtkATR+Fy+K4FcX2qDD+QSHCl3klr72KW3t0BV?=
 =?us-ascii?Q?4Vx4wDyMANmqEVwjfO0PLddNJrVuEdiGF7mHLupmVEG+xhU/gBu49js5dVMm?=
 =?us-ascii?Q?XN9pdUel3AFQYOQgsU0IsdyEWFrLbT6DHDOCOqXOi/zg3l5FYZtnLgPO/HyT?=
 =?us-ascii?Q?CZcD/jnN8bt/ACY1zCKFq03wl/UMcEXaczEF2bJRRYg8mfFCJjPRzDZ3GHid?=
 =?us-ascii?Q?wlEXr2KQfUrfsXu6yrLjnBrLjE4ZpcntbKfCeyhPxlIXjDK12SEPsFwLUCWR?=
 =?us-ascii?Q?IceY0jO4jZsTe6ZV4M1GzxNcAYxUJw+sNzd8OlbhJqaYX4GOhs8I1nfmRqlx?=
 =?us-ascii?Q?6kzal9j1Di4UpCrr+2N2RPOD2bBYAujVRMMTBNuYdAjmXi1qbWaF57OWavha?=
 =?us-ascii?Q?b6dg0Dks+hdU3AJi3P6UW0J4Yup0saQn28EKHyhO1Fq6BABgusF7yruMg1Xh?=
 =?us-ascii?Q?rV8Lbd7Qhe86jYH5dZaWSPHmib8DftUWNYTygvBjUFtXKFcpUcuUme/dsY4T?=
 =?us-ascii?Q?nx9fYazqK8xEBul7QxC+FCUf2A+IohBiihwhe5Hn?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 61aaef85-8473-4302-f3ff-08de3c9d78c0
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB5186.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 12:20:16.8098
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YxhbqEyyfOK4xsBWU9H1Jv7dquVMdOs9eOBYaESg1hxV1whuwy1T3eQjgwIUEc5rG2UXe/omT8gAop2kSGH/wA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOYP265MB2415

On Mon, 15 Dec 2025 12:57:56 -0500
Lyude Paul <lyude@redhat.com> wrote:

> A variant of SpinLock that is expected to be used in noirq contexts, so
> lock() will disable interrupts and unlock() (i.e. `Guard::drop()` will
> undo the interrupt disable.
> 
> [Boqun: Port to use spin_lock_irq_disable() and
> spin_unlock_irq_enable()]
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Co-developed-by: Boqun Feng <boqun.feng@gmail.com>
> Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
> Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
> 
> ---
> V10:
> * Also add support to GlobalLock
> * Documentation fixes from Dirk
> V11:
> * Add unit test requested by Daniel Almeida
> V14:
> - Improve rustdoc for SpinLockIrqBackend
> 
>  rust/kernel/sync.rs               |   4 +-
>  rust/kernel/sync/lock/global.rs   |   3 +
>  rust/kernel/sync/lock/spinlock.rs | 229 ++++++++++++++++++++++++++++++
>  3 files changed, 235 insertions(+), 1 deletion(-)
> 
> diff --git a/rust/kernel/sync.rs b/rust/kernel/sync.rs
> index c94753d6413e2..847edd943c457 100644
> --- a/rust/kernel/sync.rs
> +++ b/rust/kernel/sync.rs
> @@ -26,7 +26,9 @@
>  pub use condvar::{new_condvar, CondVar, CondVarTimeoutResult};
>  pub use lock::global::{global_lock, GlobalGuard, GlobalLock, GlobalLockBackend, GlobalLockedBy};
>  pub use lock::mutex::{new_mutex, Mutex, MutexGuard};
> -pub use lock::spinlock::{new_spinlock, SpinLock, SpinLockGuard};
> +pub use lock::spinlock::{
> +    new_spinlock, new_spinlock_irq, SpinLock, SpinLockGuard, SpinLockIrq, SpinLockIrqGuard,
> +};

Please convert them to the kernel import style.

>  pub use locked_by::LockedBy;
>  pub use refcount::Refcount;
>  
> diff --git a/rust/kernel/sync/lock/global.rs b/rust/kernel/sync/lock/global.rs
> index eab48108a4aeb..7030a47bc0ad1 100644
> --- a/rust/kernel/sync/lock/global.rs
> +++ b/rust/kernel/sync/lock/global.rs
> @@ -302,4 +302,7 @@ macro_rules! global_lock_inner {
>      (backend SpinLock) => {
>          $crate::sync::lock::spinlock::SpinLockBackend
>      };
> +    (backend SpinLockIrq) => {
> +        $crate::sync::lock::spinlock::SpinLockIrqBackend
> +    };
>  }
> diff --git a/rust/kernel/sync/lock/spinlock.rs b/rust/kernel/sync/lock/spinlock.rs
> index d7be38ccbdc7d..3fdfb0a8a0ab1 100644
> --- a/rust/kernel/sync/lock/spinlock.rs
> +++ b/rust/kernel/sync/lock/spinlock.rs
> @@ -3,6 +3,7 @@
>  //! A kernel spinlock.
>  //!
>  //! This module allows Rust code to use the kernel's `spinlock_t`.

I would add a new line here.

> +use crate::prelude::*;
>  
>  /// Creates a [`SpinLock`] initialiser with the given name and a newly-created lock class.
>  ///
> @@ -139,3 +140,231 @@ unsafe fn assert_is_held(ptr: *mut Self::State) {
>          unsafe { bindings::spin_assert_is_held(ptr) }
>      }
>  }
> +
> +/// Creates a [`SpinLockIrq`] initialiser with the given name and a newly-created lock class.
> +///
> +/// It uses the name if one is given, otherwise it generates one based on the file name and line
> +/// number.
> +#[macro_export]
> +macro_rules! new_spinlock_irq {
> +    ($inner:expr $(, $name:literal)? $(,)?) => {
> +        $crate::sync::SpinLockIrq::new(
> +            $inner, $crate::optional_name!($($name)?), $crate::static_lock_class!())
> +    };
> +}
> +pub use new_spinlock_irq;
> +
> +/// A spinlock that may be acquired when local processor interrupts are disabled.
> +///
> +/// This is a version of [`SpinLock`] that can only be used in contexts where interrupts for the
> +/// local CPU are disabled. It can be acquired in two ways:
> +///
> +/// - Using [`lock()`] like any other type of lock, in which case the bindings will modify the
> +///   interrupt state to ensure that local processor interrupts remain disabled for at least as long
> +///   as the [`SpinLockIrqGuard`] exists.
> +/// - Using [`lock_with()`] in contexts where a [`LocalInterruptDisabled`] token is present and
> +///   local processor interrupts are already known to be disabled, in which case the local interrupt
> +///   state will not be touched. This method should be preferred if a [`LocalInterruptDisabled`]
> +///   token is present in the scope.

It looks like the `lock_with()` is not actually introduced until a later
patch.

Best,
Gary

> +///
> +/// For more info on spinlocks, see [`SpinLock`]. For more information on interrupts,
> +/// [see the interrupt module](kernel::interrupt).
> +///
> +/// # Examples
> +///
> +/// The following example shows how to declare, allocate initialise and access a struct (`Example`)
> +/// that contains an inner struct (`Inner`) that is protected by a spinlock that requires local
> +/// processor interrupts to be disabled.
> +///
> +/// ```
> +/// use kernel::sync::{new_spinlock_irq, SpinLockIrq};
> +///
> +/// struct Inner {
> +///     a: u32,
> +///     b: u32,
> +/// }
> +///
> +/// #[pin_data]
> +/// struct Example {
> +///     #[pin]
> +///     c: SpinLockIrq<Inner>,
> +///     #[pin]
> +///     d: SpinLockIrq<Inner>,
> +/// }
> +///
> +/// impl Example {
> +///     fn new() -> impl PinInit<Self> {
> +///         pin_init!(Self {
> +///             c <- new_spinlock_irq!(Inner { a: 0, b: 10 }),
> +///             d <- new_spinlock_irq!(Inner { a: 20, b: 30 }),
> +///         })
> +///     }
> +/// }
> +///
> +/// // Allocate a boxed `Example`
> +/// let e = KBox::pin_init(Example::new(), GFP_KERNEL)?;
> +///
> +/// // Accessing an `Example` from a context where interrupts may not be disabled already.
> +/// let c_guard = e.c.lock(); // interrupts are disabled now, +1 interrupt disable refcount
> +/// let d_guard = e.d.lock(); // no interrupt state change, +1 interrupt disable refcount
> +///
> +/// assert_eq!(c_guard.a, 0);
> +/// assert_eq!(c_guard.b, 10);
> +/// assert_eq!(d_guard.a, 20);
> +/// assert_eq!(d_guard.b, 30);
> +///
> +/// drop(c_guard); // Dropping c_guard will not re-enable interrupts just yet, since d_guard is
> +///                // still in scope.
> +/// drop(d_guard); // Last interrupt disable reference dropped here, so interrupts are re-enabled
> +///                // now
> +/// # Ok::<(), Error>(())
> +/// ```
> +///
> +/// [`lock()`]: SpinLockIrq::lock
> +/// [`lock_with()`]: SpinLockIrq::lock_with
> +pub type SpinLockIrq<T> = super::Lock<T, SpinLockIrqBackend>;
> +
> +/// A kernel `spinlock_t` lock backend that can only be acquired in interrupt disabled contexts.
> +pub struct SpinLockIrqBackend;
> +
> +/// A [`Guard`] acquired from locking a [`SpinLockIrq`] using [`lock()`].
> +///
> +/// This is simply a type alias for a [`Guard`] returned from locking a [`SpinLockIrq`] using
> +/// [`lock_with()`]. It will unlock the [`SpinLockIrq`] and decrement the local processor's
> +/// interrupt disablement refcount upon being dropped.

Same here.

> +///
> +/// [`Guard`]: super::Guard
> +/// [`lock()`]: SpinLockIrq::lock
> +/// [`lock_with()`]: SpinLockIrq::lock_with

and here

> +pub type SpinLockIrqGuard<'a, T> = super::Guard<'a, T, SpinLockIrqBackend>;
> +
> +// SAFETY: The underlying kernel `spinlock_t` object ensures mutual exclusion. `relock` uses the
> +// default implementation that always calls the same locking method.
> +unsafe impl super::Backend for SpinLockIrqBackend {
> +    type State = bindings::spinlock_t;
> +    type GuardState = ();
> +
> +    unsafe fn init(
> +        ptr: *mut Self::State,
> +        name: *const crate::ffi::c_char,
> +        key: *mut bindings::lock_class_key,
> +    ) {
> +        // SAFETY: The safety requirements ensure that `ptr` is valid for writes, and `name` and
> +        // `key` are valid for read indefinitely.
> +        unsafe { bindings::__spin_lock_init(ptr, name, key) }
> +    }
> +
> +    unsafe fn lock(ptr: *mut Self::State) -> Self::GuardState {
> +        // SAFETY: The safety requirements of this function ensure that `ptr` points to valid
> +        // memory, and that it has been initialised before.
> +        unsafe { bindings::spin_lock_irq_disable(ptr) }
> +    }
> +
> +    unsafe fn unlock(ptr: *mut Self::State, _guard_state: &Self::GuardState) {
> +        // SAFETY: The safety requirements of this function ensure that `ptr` is valid and that the
> +        // caller is the owner of the spinlock.
> +        unsafe { bindings::spin_unlock_irq_enable(ptr) }
> +    }
> +
> +    unsafe fn try_lock(ptr: *mut Self::State) -> Option<Self::GuardState> {
> +        // SAFETY: The `ptr` pointer is guaranteed to be valid and initialized before use.
> +        let result = unsafe { bindings::spin_trylock_irq_disable(ptr) };
> +
> +        if result != 0 {
> +            Some(())
> +        } else {
> +            None
> +        }
> +    }
> +
> +    unsafe fn assert_is_held(ptr: *mut Self::State) {
> +        // SAFETY: The `ptr` pointer is guaranteed to be valid and initialized before use.
> +        unsafe { bindings::spin_assert_is_held(ptr) }
> +    }
> +}

> +}

