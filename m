Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020089.outbound.protection.outlook.com [52.101.196.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A1A631064B;
	Tue, 17 Feb 2026 09:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771321366; cv=fail; b=o4zRthEFzR6oGwovXgAQejbyDimEMkPkw6WGsAsNXnCUPeY9NTUMnP0EsCRCTvs+XDWBgQeirt9GZCZMvcWyZ3Z02tUxmhdG9nj1ltT7f0WVe7AUgG4eGsXZ93eNO3TMVAkycio/6PuHBK8TMebDUvg8MnwtP88klPbQmD22OGM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771321366; c=relaxed/simple;
	bh=3jIKNc0/vcfDZ4bJ6p277uA70yEz1v3DN+EaINGbTig=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:
	 Content-Type:MIME-Version; b=GxutfL/t6JMR/gqCs0+GeIiinLIRLQ2vfqKiT9cK/cCqxKLlV1VThcBcv8zyDrorQxOdmoRkANGCVEwwyxtafF4NxiSTre5Kt/t6/4Hi9B/YkL0pbrwHF6K5JdYwOom05X+02jT0m5jnnPcoTEmRtnASlU6KhrwYBAh7izFMhkc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=oyfKPsIa; arc=fail smtp.client-ip=52.101.196.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="oyfKPsIa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pYaUFKHnmV+POq0PHs/AD+s+bSMqerSWiTe0GUyqqPUEqqle2Zvevj0m8rvMoDiI9Wj+qA8P05FbPBAs3/E7qFHcAhjyBbgONEpA3uFQyIgoTtfreIbS/HafSdb4RpBdz2j8KPwEhKf8lCaly3CboTZh+ZSj9sAjWBdpIlioKQiYU5I6G/NN4kSzCg/Q9CAD4e87mJCIxhcoKHkAakenNjFyzYjr5HtPnTC+7fSCh+N8ZztgrZuBhqgICmd/woDAiuZfOqhBqgZXjjkKJeLAanUCYYApuSHuKF9WoNM9IwCzPxXoGXdU38aQp/Q1tXa9BxUnGSzjITFwGTMvUDDReQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZDP82nYdyZeLIYgExHDWi3VECyNk1FyG/xGYBUh7Fic=;
 b=gpGzJa5xyAWsd6qXRmoy+NONlwjE2pPHM/pFLLU4Lf+nDHgCUnI3wcRsvM7mQNnByw71QoZB+5+0oj9XfU7L3MBKvyrKsMVCNca0T9gVNfXUzOPZmN+0g0iw/T7jv+u9PH2hh5GOB6EVURt14WCD/PhR9cHTlpTX7Qwsg/ukjCde6xVHIoMdITLUSLzT+39lOMGbcEILS6LfCmntifYLUKOccTSDcBvSi+gZIkiSbWqT/NkLsJL1zxLePB1oXWapKwTsTmTCzy1srgK2UAcKmgLvSjVL6jglxdf2fcfUNx24vcILXDffWggjEo82fUR7u2bF4YetE9Ir0UVL6TgYvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZDP82nYdyZeLIYgExHDWi3VECyNk1FyG/xGYBUh7Fic=;
 b=oyfKPsIamwpxIFieugjAL+VZ2y/HrCdmZ60ECgOHQxdWdnT7ifjGLV72k+Qv5TSg21QBc0rXf+I5m42TNy5tw9o/gtEm8u2F20tC7dEKCLBSRkxSKKdiIUTlwdDYer8wwgt7yMXuiWW1Ss3+BoZ++C2B9s7if/qv24MP3MQg0Jo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO0P265MB5525.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:274::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.15; Tue, 17 Feb
 2026 09:42:38 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9611.013; Tue, 17 Feb 2026
 09:42:38 +0000
Date: Tue, 17 Feb 2026 09:42:37 +0000
From: Gary Guo <gary@garyguo.net>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Boqun Feng <boqun@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Lorenzo Stoakes
 <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin
 <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich
 <dakr@kernel.org>, Will Deacon <will@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, linux-mm@kvack.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] rust: page: add byte-wise atomic memory copy methods
In-Reply-To: <20260217085541.GS1395266@noisy.programming.kicks-ass.net>
References: <20260213-page-volatile-io-v3-1-d60487b04d40@kernel.org>
 <aY9i8rbvnxdOA9DV@tardis.local>
 <20260217085541.GS1395266@noisy.programming.kicks-ass.net>
Message-ID: <102c86dd6fb1a907b7138a437dee00dc@garyguo.net>
X-Sender: gary@garyguo.net
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0243.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:350::7) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO0P265MB5525:EE_
X-MS-Office365-Filtering-Correlation-Id: bd6b6f38-fd13-4fee-d721-08de6e08e2ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HL8lyC091ep5uk4rhMaJZTlSsbVBv6cBSZL0Ut1ivZIMOh1UlX+VgpFmL4v/?=
 =?us-ascii?Q?9cmcoGhAcuJnYSLVZTF2PeOMPxk0x0tb4SF3UZfwtgDJD2aeiKKZCbKBxOJp?=
 =?us-ascii?Q?45u3q1DKNtqYb2wdWOYl70WkBOp8MhnT/LwcULL+jke01phl3MXGouDfoCij?=
 =?us-ascii?Q?qZfgAoy5Pl1IFYFco66IVnms1NXcLTZ/fBjEuVacnhHvfuELljq+06BIGWf4?=
 =?us-ascii?Q?nXFPnmJ1gvSRgvJagyhlvzp2ABPXtJCgIseCWi/JsHFJ1uoSUsZ9VljU+cCh?=
 =?us-ascii?Q?KLiT3jbRrIJiifeCyNdVxcyQuIrWW2yKe8g+RXF8ls4CWWptyK6lIFXAwBc3?=
 =?us-ascii?Q?BIrAx7WEFNNgTY65pvJoAogw0sfjFI0c54wA4C7nUPuh/IddAiSougbKmvJG?=
 =?us-ascii?Q?PxUobq7zrqYJu0ycmUyyMT3kJ92bfGb08mrBSQAgjehIPJPQOEbfazDI+wcg?=
 =?us-ascii?Q?vq/nZLKReTEf/QxFMVWitU04/Jpy4dQ/MoJigVnYvzrCzPtWNmMZdam/GhOC?=
 =?us-ascii?Q?jkYTgtdV+5Cxgmq1S9gYEHZn85fI3abfB6ozefSq8HaYVVWZqIVHhZG9StS5?=
 =?us-ascii?Q?oo0OZbpYZDr/faHhmmC6ZdId/Vu7uvbZU0jgTSnV44QuEJxTQpeeXr6lFAG6?=
 =?us-ascii?Q?oag9v47tqerjhdCc6UqGViJwrgST+PTlzFPh84npp5bYlkzOmwrrOST9GAs/?=
 =?us-ascii?Q?pFkJkupgU+rsffh8dYtX8oWjE1geEsM69o8Tpp+NmdxicpdI/CMI2wJlQhx7?=
 =?us-ascii?Q?iHoVk7EQda/KxNrmGy3c82Iqnbjao4JndNLTxyhILt0dH60jT3H/ARjtOZk4?=
 =?us-ascii?Q?vARf4QyO+6ckMYSF7RszwsX1LfQEfbJIiBbdtw26FLRFxTro+QcUWl9ENRcG?=
 =?us-ascii?Q?qpElI4tImjgjvkJfjoIN8ayFcVcXPtYx6Q5ZFVUgznKUxquANicAwRhapjIr?=
 =?us-ascii?Q?xZxQB/patw3m6IOXm9Ia1VU7vzWJXTSYYdUIPYSfl1BBx1ANJStyB8IqBNRj?=
 =?us-ascii?Q?/oeB9NYt8qPQaIjJWrCzsI2lmoWkvlsjESW7YO03U5ltWRPjw+moPUbsQmWf?=
 =?us-ascii?Q?M+YE7byTWhAlbXl7tpMG6BPyWTIdY4oOYqRL1y5uPzlVe9/sYu+6cTM2Dj0J?=
 =?us-ascii?Q?mFWMoeiQl8vTnefkEE+gf0Bh+qqwsdBgOhUM56ey4nWNYaRpCnpByX2XmF1m?=
 =?us-ascii?Q?iXaN0sdnF1LTIeub9WCK7RV7uzVy7Yhg//HxaRg8pFiYu80ZUX2H2JJu6lsf?=
 =?us-ascii?Q?RUsIcYf4751FZ+hgkXr3oGqezQdUepeG3VNl44dSPAEe+qViwrmI7bf9SoBj?=
 =?us-ascii?Q?NhnNuXjgJ4P6OEcfTk9aX5azx3svRbkrQQg728N93ADVx61eoupJ64WuEyEd?=
 =?us-ascii?Q?75tFpIFPaz4j/yKZgpskr2tjsPLLPcDjQ2EouM11rLITHUe7c0yc2ytRLVjL?=
 =?us-ascii?Q?n4mtrQNHfvIX6xoHjGzC9zy5O+EWlxmo4KMOLSueP2foe5CyX81CTEcE0QRW?=
 =?us-ascii?Q?nxJ3dPtxjg6ztlyjiadaqF0TD99WLYLcn9v/Hr9PtG6ZA7iHPEVr7lLcJnYJ?=
 =?us-ascii?Q?fJhBDcQI6JtIUdibZh4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?L0noq5BY+96U2fkSwx9Qb3wuo2wyhQTu3Xlis2pPdh9eMODaRthS8BfrqNJa?=
 =?us-ascii?Q?u1AlP5bkP5veN9Z47N1tUy1zF3SQQSYOZgghowGnd3HdOacEB9GLoK4qlSWO?=
 =?us-ascii?Q?9bS1VjZVQbJvXruYXTXv6kvT01MpkOk26AnxUOji22InY0IOsr4N4GYvrQ8q?=
 =?us-ascii?Q?zOEIhTq/iDhb9D5AfIKOtrKL7byC7OntgrzEX9a3V1vy/GbZ7nIdwmvqEU0d?=
 =?us-ascii?Q?d8Z9PkUNpTbE90cpF5O+momr9UsgzwROtMo2A4dDBnoq/uoekYl7LfZxoRI/?=
 =?us-ascii?Q?z9/JSsMzxkEpzxINY1yefgh+cj7DgwYKXMMyakywUq3Rf/W3ml1/Jlspveln?=
 =?us-ascii?Q?zmf2725OfsQj42ZbLrwAFCOyn7h47aoGTEzao7zd+I2ERWLjtycVlbbTccQ8?=
 =?us-ascii?Q?w2YE6hG/qzQdybursz8XoOAuZtPaiaSZKVViXuUigVSUTY/toeY2il7U9+Iz?=
 =?us-ascii?Q?jOj7wVzIehNOzMv104qf3uFIhKwjvXDdYldu6PFGCMRUN/SDnzujc2NTeLDT?=
 =?us-ascii?Q?P5IO+M8mDSEldqm/YoScONUA9VOUfjg33fsyAoYiAMz/BHAzwQabBPqsZDrh?=
 =?us-ascii?Q?QzDj6DdPi8A6ogqeocS1ErjWXCGI360U/K+oBdNUgjndglVTg/lhEWaa+5Ws?=
 =?us-ascii?Q?W507WrketQStgZj09QL8fhdFctPhPDbt5haUereD/XMbo5Dy0vfUb+LhJ1Ht?=
 =?us-ascii?Q?1MO+kEcebJgdEIeqQ5NjESLxkPthWZmK0yzA6sR0mxDiSD4tSQ6qRUI915nw?=
 =?us-ascii?Q?8/O4sr3sV6mRVOcjYRAh+vBYQEdGvvRAUdAhmgi7PkzGWQgBQF6/mOTRh7VI?=
 =?us-ascii?Q?aoVojJNMKk1kFgwPJSbFTzLtGf2SMx99fuH9lxo8SxyMAVs729+6iT/w/gdV?=
 =?us-ascii?Q?JgX5H9ZvAxMpaWfBiC28kwXLo/pUPkvN6IAkl6muMdSPhRFvHc28XFnRi4eU?=
 =?us-ascii?Q?xM6C2cMI1sMykC5vlr+AkaNWBcORuSMqzdoT+9MebYhWqzZkUXaAsIsTS+Cd?=
 =?us-ascii?Q?QTTP1FPdwN74e2i91GsXyTDhymkSzlH6tYWeGaCYgHRVuqkxqh5ZGMDBcxuW?=
 =?us-ascii?Q?IM2piIEziYTqPMaUZRhe0YjSJGO9OWdPmMVA9b9Sp9n4GPFeFe7wwgDEBzQD?=
 =?us-ascii?Q?KG//ePU6xgjVtkPLj92Uq1FpNFqdjVjvUqxq6ze4wifHVr0A5wbm7IkViKF0?=
 =?us-ascii?Q?dbPNp7rknKBpXBySJzb+u0SH7wjGu98yTkqQ2GdmNOGBifBZN7TlJSz/jpmh?=
 =?us-ascii?Q?icOfqCbu3KJwAFBzUwn0BHfcUl31IDiU50tKUk3dX/WQ81P1tukeGIogvE44?=
 =?us-ascii?Q?S5R+y7ZIlgB/axcFNBppreeh0HcsriIqzz4CAsGEXsY5EMmQHeDVlGEvs11x?=
 =?us-ascii?Q?8KbVJoYrLbZ0kYxGkzJ/P/6+hR7HdtKRdHC2r7+ITBw4aCDWoYDP8wXHPNHy?=
 =?us-ascii?Q?c5VlVABDUA5DpzKQ38I8ahljz26OQbIV8PvMvCQM8fBesmoan87wpVKDTE8l?=
 =?us-ascii?Q?b3lMJvtgvR4prFJUQjYUFYlm+mSLagagPedcyUtUcal29Tlp96drbEKRRCKQ?=
 =?us-ascii?Q?KDwWkwOvLXVImSinQV+kG7ePZhYwPX/LeVBtRqWH9Ef6ytzA2dOH4uAhgZ9z?=
 =?us-ascii?Q?3TFrRTSDY9YEwKICSDSUIXvUVkXKsPpt9zxe72jqfC3bKl3649TlYVjBRRY8?=
 =?us-ascii?Q?FhbIQ6JmRwNyaExOywmeUXO3xTpnZ4ay7KbQxsJbfnEOAspiIGWNLaZQqHqo?=
 =?us-ascii?Q?SB8zDeXMTw=3D=3D?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: bd6b6f38-fd13-4fee-d721-08de6e08e2ea
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 09:42:38.0261
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KSBxmVd2NhRi3Ja5Q7rE6gkChkOG1ZfmYvRRhC/yZkGTnqkzAPB0tYRA4OYejaTKdFukVQJAG9EbIR/P3vt9tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB5525

On 2026-02-17 08:55, Peter Zijlstra wrote:
> On Fri, Feb 13, 2026 at 09:44:18AM -0800, Boqun Feng wrote:
>> On Fri, Feb 13, 2026 at 07:42:53AM +0100, Andreas Hindborg wrote:
>> [...]
>> > diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
>> > index 4aebeacb961a2..8ab20126a88cf 100644
>> > --- a/rust/kernel/sync/atomic.rs
>> > +++ b/rust/kernel/sync/atomic.rs
>> > @@ -560,3 +560,35 @@ pub fn fetch_add<Rhs, Ordering: ordering::Ordering>(&self, v: Rhs, _: Ordering)
>> >          unsafe { from_repr(ret) }
>> >      }
>> >  }
>> > +
>> > +/// Copy `len` bytes from `src` to `dst` using byte-wise atomic operations.
>> > +///
>> 
>> Given Greg and Peter's feedback, I think it's better to call out why we
>> need `atomic_per_byte_memcpy()` and why we use bindings::memcpy() to
>> implement it. How about a paragraph as follow:
>> 
>> /// This is the concurrent-safe version of `core::ptr::copy()` (the
>> /// counterpart of standard C's `memcpy()`). Because of the atomicity at
>> /// byte level, when racing with another concurrent atomic access (or
>> /// a normal read races with an atomic read) or an external access (from
>> /// DMA or userspace), the behavior of this function is defined:
>> /// copying memory at the (at least) byte granularity.
>> ///
>> /// Implementation note: it's currently implemented by kernel's
>> /// `memcpy()`, because kernel's `memcpy()` is implemented in a way that
>> /// byte-wise atomic memory load/store instructions are used.
>> 
>> And probably we make it a separate patch for this
>> atomic_per_byte_memcpy().
>> 
>> Thoughts?
> 
> Its still not making sense; an no kernel memcpy() does not necessarily
> use byte wise copy. And please stop talking about 'atomic' here. There
> are no atomic ops used (and atomic ops will fundamentally not help).

Byte-wise atomicity means that the guaranteed atomicity is per-byte, not that
the copying is per byte. The copying size and order can be arbitrary.

The "atomicity" is needed here so that concurrent access is defined and does
not race. "Per-byte" means that tearing is allowed to be observed.

Best,
Gary

> 
> Seriously, none of this makes *ANY* sense.
> 
> Yes we have racing copies. And yes that is 'tricky'. But there is no
> magic fix. Nor does it matter.
> 
> You copy 'n' bytes (in any way you like, preferably the fastest, that's
> all that really matters), and then you get to go validate that the
> content makes sense, like always when you get something from userspace.
> Must not trust userspace.
> 
> So even if there was no concurrency, and your copy is 'perfect' you
> *STILL* must not trust it. So the presence of concurrency matters not.
> It is just another way userspace can serve you bad values, nothing more,
> nothing less.
