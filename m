Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022074.outbound.protection.outlook.com [52.101.101.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F6232C159C;
	Mon,  8 Dec 2025 15:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765208597; cv=fail; b=HetzfJICZXoKBSBLvWLCPFlt5AcQWp9tzPLChnML5pyZbYzUiKHumWujYP2fSdyxH7FfCOjvWNLGa8qL50lK6433UDeJezK4VcYCAu+D6eAU6zzkje2kK/NH6sd/9kVVpo4ZCq7JIwYZmIkDvoFlA1qmPOKcDPhqvN62iofoF/U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765208597; c=relaxed/simple;
	bh=ejZNdEOLz8FElok85n/E8TLhqK8M7H+RSA/4XMccnKs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NBVECWmvzYs4xOA8cemQKskkdhOXF7NTJjOyCXllCSseHs4OH8WwLtgw4l3OZbv1QAVoq1hVQvvJCrnVDGtpZWi+V1X5+APIEIZL+I0yd4J/qYfE5keDs1G5sikOaHK2dW/+AXNctTQW8sxVJ6JGnbtAG8e4Kr1Ozakj48oz8OA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=hRERoC8x; arc=fail smtp.client-ip=52.101.101.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="hRERoC8x"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DIFbs60if+oi1IVMVa59FzLgnsUCmC3EBNiSLLc4NIJkIhTb+s+Oj8QkICqSk5/CH5PveC+kOuT0dOiuAKdhpa9ZnTN78BtIeN05BLzJDxfFWi9jajvhSlCZl4CUgnVONXAjOUFw/+W5ZZwKEMWnbzfg9WoJLX7Gwz4881EeS1WQI8iCPJ7vY4tFkDwyWpDhGaBzJMnOfVIsThYCtS1Bi3NanmRNanlTQcCpWbCioMK4oW/UBp8p1E088w/NrMCzMhPbF5yKLfdbFjPvwId1c9ixQwazFnC4vkmebO239441k79b4jxOEWedkMJnyEAD2yffnGa1DnieJJPLWsaxLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cPDGSsEN+W4rbTfYhBHZH1tlIUWK6NgCNnE3Ue0207I=;
 b=DUAdiiOsujWYsTih76BUkL5oKv1xpRrGHvaRS7KKS9nBMyfeqP+mkoe1w5UASepFZo/MHmS7lWmaJY0irYns3Wg1eSTOBb22Z1U7FNIPgmmuoXCbzJRQeRh53Zeb3hyzEtAmkXKJwh9TPC52c6SHfi5XmW+ShtGGnIZ1yzij8x02oGqjT1jJfPUF27DpueMzha1YsXyDsBg0LITE8ngpbt5hnhU0VenrdVjfEcp9ZohBZ6QbqePFt50I388mc1dc23L+9nqiKlwDN8KADRgh1JOFT0UiU90XCsGTACbBE92KWU5qr6Dd38VOYgx1EPnRhH6yftZ1rBUEj5U69G3R/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cPDGSsEN+W4rbTfYhBHZH1tlIUWK6NgCNnE3Ue0207I=;
 b=hRERoC8xmLAQwMQINZKJbH/Dk5wOV7bqPxEES9PsI+lqTR5sQE14kja39ubQU0hEzJZ8JXMpMe9y3CGNf6I3LhLpyJ4ZGvZyJCx5mCbi8KRorroQDOdhxYujTHTzYwAK59lJWKczbSj2nspJAMWyyIZT4a4va16XWP6zlZFH2YU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:253::10)
 by CWXP265MB5595.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:159::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 15:43:10 +0000
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7]) by LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7%6]) with mapi id 15.20.9388.013; Mon, 8 Dec 2025
 15:43:10 +0000
Date: Mon, 8 Dec 2025 15:43:07 +0000
From: Gary Guo <gary@garyguo.net>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Oleg Nesterov <oleg@redhat.com>, Christian Brauner
 <christian@brauner.io>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor
 <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, "
 =?UTF-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin
 <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross
 <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Panagiotis
 Foliadis <pfoliadis@posteo.net>, Shankari Anand
 <shankari.ak0208@gmail.com>, FUJITA Tomonori <fujita.tomonori@gmail.com>,
 Alexey Gladkov <legion@kernel.org>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: rust: wrong SAFETY comments in group_leader() and pid() +
 questions
Message-ID: <20251208154307.0737cc2d.gary@garyguo.net>
In-Reply-To: <aTMhpX-_H4Y4J7Ud@google.com>
References: <aTLnV-5jlgfk1aRK@redhat.com>
	<aTLp73haymcs1fkX@google.com>
	<aTLsUDBbcbl2ivme@google.com>
	<aTMUqp5pXzAscrdZ@redhat.com>
	<aTMhpX-_H4Y4J7Ud@google.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0391.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18f::18) To LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:253::10)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LO2P265MB5183:EE_|CWXP265MB5595:EE_
X-MS-Office365-Filtering-Correlation-Id: e9a507b1-f595-4375-534a-08de36707d46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|366016|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Za/2+3P8RQnnx6Eaa0qamm6emq4A9qDh1DtgRs1DYUD/rscSrVVCI5bhHwYL?=
 =?us-ascii?Q?k6fsbfS2mVUXiWEpVSGwY8DTVoFWZGjMCz+vBnZIyeRUcBRsncmdJv3LwD6V?=
 =?us-ascii?Q?S6voKLEwN4NekAjBmq3HFTduHAVhQG0muPwU6KNtWG4ShxIVZSTHiWlPy8iu?=
 =?us-ascii?Q?9QO6E99gE2C78+G7BG9aVEmmPPsbtVVefx8sZfPOxLe6EDuDP069Gp272Jeg?=
 =?us-ascii?Q?Z/xd0o2DkDga2xmZ2g+31opfFStcOtVgFDWP0RQXat9K05vWnN2yY3Jahegi?=
 =?us-ascii?Q?Exh0EBpAXfzM5GatKuTTXszEUr/4rItnDA/eiqSZdilornjpV55IX/Hd8jq0?=
 =?us-ascii?Q?Opg5a9wec7ib3rkbEvLyyl0+8NM9o6yz1/V3DNvIdUmgz2UO5X9M7eVov/K8?=
 =?us-ascii?Q?MSSyRZFGwW0BUIP7qjkGhaeSC1ne6wuG8L3rXIRovojzE26alBXQrf3in3pa?=
 =?us-ascii?Q?wBCLJ6NuIOzCRjYl2L7tYFX5cqr1HChzA1/LihpPIVM5ijRuQo46nTtUUN0z?=
 =?us-ascii?Q?LaTKc5CQQe2MlYtehRfBLGf3fhCMRDMCUJKyJhEGLqj0/s6yfSNCWa9zNvaT?=
 =?us-ascii?Q?KieL8i5ldO57WRt7O2MjpI6EpqDD6ssNeikMSwBWzmgG9f3ryJtqEuvq+raI?=
 =?us-ascii?Q?tYoRvm8pZGio3j0vWTcNUE5ME0enFX6IPSWdXgNRJm20737jRo8Q7WJk9cD+?=
 =?us-ascii?Q?8MEYrZ6/1TzO44FOiA1R6cymRKewZx+fUIT/8NIppfUr3YwicysYDKtRtiet?=
 =?us-ascii?Q?VcFQpYi8fpX0XHhM6JLSr0xuLFQ9RQE3RRL4CTFCn6V3Z+/tkLNjfxQ9O0As?=
 =?us-ascii?Q?6rfUweKSRIMbmlc+x2DKqFmyFr3Emkhq6XXGWgkjB30bTA9bau/G69Sr99Ig?=
 =?us-ascii?Q?bdeSwcSz1iufinMAyPH2CzabH/IzMxRKmhT85P/JkcVVexZk7u/cKHCvzrnv?=
 =?us-ascii?Q?8gzFBOb7tEBSX9yFy+IBlpX4yj5wTbi9juGOT5/1luu7WaJv5OIJu4vELEaq?=
 =?us-ascii?Q?75WeBHUW0A3GsOCzRbc/bBU6kZaiAxxxai2Y5GfDLJhVCYvcJo+j9zLnKtuU?=
 =?us-ascii?Q?fQurVNpGeOniuc6f3p/PWZ080We8Zo3K7efqgHmwBVmlp93ElDKg1aSQixxB?=
 =?us-ascii?Q?pG2eS6vPo95ejCyxyOQQhO2fiavyTE8ZO1GD1G97bYzeHOFwgLLiHqMQynW7?=
 =?us-ascii?Q?Law3v+QK0D6k5+2PztOvxEu0QyVxhejBXjdQz2Q7ynBhkdsThB80VUTLZ20R?=
 =?us-ascii?Q?RbHB6plqPcl71Ldq4ufYzLEPw6P3GRUi2bwL7jNHXFe346Ou5omDGzHLMaEn?=
 =?us-ascii?Q?Z5i04AOXUFvssZI2bZS7EZILCMw2WUI/DxDq3lWX+hKTJ8doYfCfJiMcBcIt?=
 =?us-ascii?Q?bgVW18cNiwX7DGte7sGtKALEpW2YLERa03hZrCVXCXZJlwPHAB6phjOifWkh?=
 =?us-ascii?Q?/LnkhWxZZ5yQLtoeQ/nip1ttloAzqYWN?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(7416014)(376014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?S8eo5MQvYXySIUjuL+7sPCKPfSIUCEQEu3gzajulkay1dfrvzF41E+HUqViL?=
 =?us-ascii?Q?CTZU1oYge8LTCVZL6DEYXzRObeA8XPezwMRbvg6VJzbpzy8zxfLpcataCnzF?=
 =?us-ascii?Q?jlTSzqHs8jlJy28K+dEMhbVaqKG4mRTwMzucnTS2S/vtkGFSKxdhFCERmERd?=
 =?us-ascii?Q?o8YbDUEgoF66TGeib5tCCFST3hyUlx4zHZR/2TtYbag07qO9r1BPj4PaS7Iu?=
 =?us-ascii?Q?aUnSGsFEBx4KsicGklgKtv03mNZMGS788dQEn3bW/it7vdHq9GlEBSpDbwB9?=
 =?us-ascii?Q?HGgu3LbcifF6oIIDPTqL1CSbDwQmeo/0J/4pynOcEfJScbCwYBVbXPOyiKIt?=
 =?us-ascii?Q?ZsnUNy839eqTQzNVI5kMxOdftkmSGkBsoaoAZq1pq0oKxwrFgfsz4cctqxoX?=
 =?us-ascii?Q?91xrkT+KqvJdgTMl75k14Hft4CHhvZMs4AE6dkHUGLMqGBPwcN1+XbTSpV42?=
 =?us-ascii?Q?pH4H6/5JNzLd1dNG2viO6OlUInxLgqyY+LfGubBh/JnjECApzsl7qWNd3CXX?=
 =?us-ascii?Q?MP/KlN5AFsjUkGVdWi+cE9DuiDqDoxP3veA9rv0a25MzTs/4bZzyJUOxFUmb?=
 =?us-ascii?Q?2BNgQ6XrX7tkXJTxlbmHbW/XvFg4yEnFdHaonwFtu7pJsfJMaO7N8iMjNaeN?=
 =?us-ascii?Q?36l5eWMGbohq4wQKhZTBlsOMhwznKk6SNA3bo7pJYy5wePS3Bjcj1QqyCWnF?=
 =?us-ascii?Q?33Wx+yWRR23FWleURkMh8UFgIUCg1s0Zf9NgnjrLGC2mprjdgAngD+qgnvKb?=
 =?us-ascii?Q?D/5va8kPVKWpLoEjA0f2TAo+aVVSr0kjsuedv4SATyLciv4UsZJTxmZplhE1?=
 =?us-ascii?Q?n4E4My5OLJse3uuEJzEAkjPapWmrPRgNiwCZuaBmbl/B/DWKRpGPP34WBBd+?=
 =?us-ascii?Q?tniD8LbK0Kt8Ob1X6G9A3ZJtjkdixlGLOKWd1fHJRkzUOJYaL4cebsGny/Ww?=
 =?us-ascii?Q?wt9rDQjupxSZb029+b8z/0CT0YJB6VoIJ4e4lz+AarULvl+ipmXFJnMh9Wr/?=
 =?us-ascii?Q?FwJhVXkKwktvjTmjk1lzjevDdDL7ViHhvIxiCLjRp6yARbv4R4nCYWUYQIHq?=
 =?us-ascii?Q?moEQmuPq4WVQE9ZwOFviWFFbMHQMnAxuI3Ss7hGq7GOv/IecgH/vNO1Ax/UV?=
 =?us-ascii?Q?vf5YkoEYAzZib6SFPZ9nLOFsDhKECv1yE9+vPTyTWZaVHBRzUs2StIAzesKH?=
 =?us-ascii?Q?6zk8YNaLJqeaUPywLYC1uzxSP/8KRzVhJsKnM/Nfc8SfzqU+qHS8BVsuLBPZ?=
 =?us-ascii?Q?pT8hNrAn29iVqnAho9g4JpHhfTsto35BtjPIU+DzBgPJvc3y5XRivYpF21Fv?=
 =?us-ascii?Q?kTgejk51BeTU92FjPA2SSN7kA1SDdue+Nh2/Q+Gkz7G0tmch68TBLZ/AnWZJ?=
 =?us-ascii?Q?0rCIC3u8/EH4JvOIjak923Izhdbg+h8UefEUHshRh1dGvnhVlDF+M181rvn/?=
 =?us-ascii?Q?+q94tiSTMT/7SJDn1RAGR1O6iO7KInfxwIn3HILpVc+l+hkF0Kc/Diu8Zylq?=
 =?us-ascii?Q?jclJGpbvP8rppvwNjYa3r/biv20qLkRa3Gj1ifHqn0kp5SRDQPBdw1DhkQ78?=
 =?us-ascii?Q?nQGaG4rN4ni+P3sG7KeysQXbpmhYC6NseU8feg2h?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: e9a507b1-f595-4375-534a-08de36707d46
X-MS-Exchange-CrossTenant-AuthSource: LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 15:43:10.1422
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WV2kNIeYrmraIJ9K8nQPNN/3uJ/c2Zz7+nID/Pd4WfqV9QMjR/fvkms+QMib1Za4ciwX1uHPhy89Ew/nU+CLVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB5595

On Fri, 5 Dec 2025 18:17:09 +0000
Alice Ryhl <aliceryhl@google.com> wrote:

> On Fri, Dec 05, 2025 at 06:21:46PM +0100, Oleg Nesterov wrote:
> > On 12/05, Alice Ryhl wrote:  
> > >
> > > pub fn group_leader(&self) -> &Task {
> > >     // SAFETY: The lifetime of the returned task reference is tied to
> > >     // the lifetime of `self`, and given that a task has a reference to
> > >     // its group leader, we know it must be valid for the lifetime of
> > >     // the returned task reference.
> > >     unsafe { &*bindings::task_group_leader(self.as_ptr()).cast::<Task>() }
> > > }  
> > 
> > Thanks again Alice, but the comment still looks misleading to me...
> > OK, quite possibly this is because I don't understand what does the
> > "lifetime of the returned task reference" actually mean in the rust code.
> > Does it mean "lifetime of task_struct" of "lifetime of the process/thread" ?  
> 
> To start with, it's likely that this comment is not the right choice
> for this function, given our discussion. Most likely group_leader()
> needs to be moved to `impl CurrentTask {}` and the safety comment needs
> to explain why being the current task ensures that the returned &Task
> lives for long enough. I just took the safety comment from the code we
> have today.

This indeed sounds like the right approach to take.

If `Task::pid` or `Task::group_leader` just gives the pid or group
leader at the time of invocation and doesn't have any stability
guarantee, then the user of the functions will likely be misusing these
functions.

It's better to just have them on `CurrentTask` for now. When an user
arises that need to retrieve them for another task, then we can come
back and think about a proper solution taking the scenario into account.

Best,
Gary
