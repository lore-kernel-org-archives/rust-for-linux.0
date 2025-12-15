Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021116.outbound.protection.outlook.com [52.101.100.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20871125B2;
	Mon, 15 Dec 2025 13:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.116
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765803724; cv=fail; b=kL2i1zCwhwI+fScKD7UzOlIBVkh+BwW+1TUCcoB2x3I6fWpoh91r6rIK/xEHnFIb8bO+r67KoC0YdRlONqRvsJFwP8XbKT6+fkUN71EKZifgfeVFuYwUFwtn083W+4+BJ28+hfKfFGQaNco5X6f4Ub0AKR0rVlnbKdFlN5b4s8Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765803724; c=relaxed/simple;
	bh=aaqHu5X0x44ajcTGOEm5ZWWonr2XJyMI+5rsNFH34rY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=d1tvB6c/qfvtLusLt0uXL91UB1aPN5WqrCiARaaF5lPRIzLbd/1rBK0f0DtRTwOCXnNI3SHpHsI8TLZzVHsklDiUh4NQ34qUBkuYUXp9dyyCyKL+YXvQ8XCyYnc4aboxjmxXBvEljx9fq6J8dPrn9xGe/vHa4EKt0TIzH0H62tY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=TXSdE4E8; arc=fail smtp.client-ip=52.101.100.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="TXSdE4E8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CGfjsL3K4+rNL46OEATNHVFvdDB9Ce0rxuAnYbpBWVmhWULpQEU1ndOYZc2ZGQoST9KdUDTpLNKJoe4xoom9DAPsSM/sJxUTVXQxqEHFL6xm/zAFK6KXXKSrmH3x5YtWBFsH6AAvGRnJEy5X2mK1D3johLSGc/hW9IofCS37gphTM8qR0CyJGB51bYq/+d1qt5yBOMULCR8o/mUnaYWDVLvNAx4RBQaa0uEGSjq2yN1WAHkHONj5U1go6YMyIf5qkrLTrNrAXQ5njIt+/x9tqUsho7i8GIzEFGaYEf2bVe58NpFIYiJ2Wgg5Kp/RyjKTD1XJwAJqQE/FvS7iIAwnng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ec6434STXMbMOWyG6/IsBHhDFqd78kSHFFUSEv1eo6M=;
 b=iOhl89MNZSgypg3fLy7lRTqaTWztjy7siCY2FJMIGB2t09lDumPdp9NUbMepH3ZrJwPG2QCWW8Ef4HXRO4baeASYVwM90S5JWmoeXZb6C+Y/efEulP7obDtIAE6OEEI8peTguMrqH/9IkkLegzTQBMBvWqF3n2vlL2Qwd1pVzk7LuVrFKhNfuQ4BaD5FPhQygef+3ufBkjUcOQ1mGJSfdv3F0cpPznJatefMrGtqMV3bC6fwGX/OS/zAsZmkS8FTYumUgZwYuhe2Pp58wv/Nm4lf3TpSY8MDP/JwnHFhUu84fsvqOtE69ghOA0TJU/6SPuTeszeADMNzXbdmAlbpFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ec6434STXMbMOWyG6/IsBHhDFqd78kSHFFUSEv1eo6M=;
 b=TXSdE4E8WpgKTbmZvzrppPxut6PqGe3Fu5dFTlgfI7C+evhHe9BnJLDjXbQQU1YfpRKP6MtzqMZWUruid91cReLdweRtrn0D5wj5IwXttusu4EPeg11RY1swGBmAY48EJT36EpYcz97lBbQi7/ZE8atMn8DVPF5oQBibDN66jPE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:253::10)
 by LO6P265MB6508.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2da::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 13:01:57 +0000
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7]) by LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7%6]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 13:01:57 +0000
Date: Mon, 15 Dec 2025 13:01:56 +0000
From: Gary Guo <gary@garyguo.net>
To: Christian Schrefl <chrisi.schrefl@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 =?UTF-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin
 <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich
 <dakr@kernel.org>, Fiona Behrens <me@Kloenk.dev>,
 rust-for-linux@vger.kernel.org, Tamir Duberstein <tamird@gmail.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/11] rust: pin-init: internal: remove proc-macro[2]
 and quote workarounds
Message-ID: <20251215130156.23926cea.gary@garyguo.net>
In-Reply-To: <f3699da2-288a-4743-895a-f54daa1a51e7@gmail.com>
References: <20251211185805.2835633-1-gary@kernel.org>
	<20251211185805.2835633-2-gary@kernel.org>
	<f3699da2-288a-4743-895a-f54daa1a51e7@gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0260.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:194::13) To LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:253::10)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LO2P265MB5183:EE_|LO6P265MB6508:EE_
X-MS-Office365-Filtering-Correlation-Id: dd144617-8392-4ef2-b528-08de3bda20ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|10070799003|1800799024|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bm/6tKa+IVlCqi9OJPKPuHmG+ypXgZ9yKw96N5+9gKfBiSjQ5qv/ofaQgW7F?=
 =?us-ascii?Q?EVKytRJW8MTY3+e0dg9uVt3hn+yQToVOGQKdk7BNXOgIntVsIgAJ5wUWMdkn?=
 =?us-ascii?Q?XKazS2XIKPeDTAINjedR43NSDAsqO2UfPMU3Z13wHi/zVGS6uQ58b1wgD2h3?=
 =?us-ascii?Q?htpB7u6lzgFYBMXvOkShTx1NaLAFD2BtMp560GkL50ic3pi10GC/ROD556/A?=
 =?us-ascii?Q?PbkPY3XtTYbAPLdl+X0PWkp9LnwQ9W/jkSGbIb5PpuLaeQ/I4Tt61ePs97Sd?=
 =?us-ascii?Q?/3nMwnnecnWkAwKmOTMQYifv1NAD3U+rGWSut7E4QtdJh7zCc9toTphRPb3e?=
 =?us-ascii?Q?x6a1S1QMDlbOZObJYqmIiIhtj/byzHmLWyG7pexUQpXYGl+2uzmusC6kviml?=
 =?us-ascii?Q?L0ab93IDQ85svAmudi5rheZ+K4/MwP6lgongU5u63oE4ej68LNWo/xPT3OpO?=
 =?us-ascii?Q?WtvGunhTDh4sagEJHu5DuAub5t4QpFHplX+oSHcPTHGiSHZa8n41eiDox2Dg?=
 =?us-ascii?Q?09xXhfOnaS7iFQlQWS2BnyAkvrDKVsEF4+zdEov6GsCsQETYy6VrfSXyJXsT?=
 =?us-ascii?Q?ptGp4B975fwRWfxV83jRbyU0Sv8TMshmz0Nv7j1m8I4j5KlMUG6IBg6CQife?=
 =?us-ascii?Q?JeBhXe1GV1pqvpXjzMJ716YqH+FXIeIwVUH+rHJQ9eDShRL3FYZDlu6E68fM?=
 =?us-ascii?Q?7Gb1Z0YRJx3zoUCGbZz9tSiqo4d1OUEaExsBAZdH1hvkihacVinhi2Oe6faE?=
 =?us-ascii?Q?qgYqX3lD4ubxE1kHCNsf9leZbsGYMF8gmbdp8/uv0LJkyBgT3pQc6uBQptFI?=
 =?us-ascii?Q?rPNpC/8+PCk4xaBA6n/ii5v8anMuxR3kASchDx/fNVg4V8DqUe/cJaBSCDAC?=
 =?us-ascii?Q?izDyO7ZMnWXhZRVsWZzn0ZNe1xCEwIUwkLMW5hC+eYjjTxGAbbM+6DWcPe7D?=
 =?us-ascii?Q?JHxPjp5Vfqxb4x1oXbt+I4sjQ02DmoNTkYPyOO+U5XFG35sejtWkdXxALlFD?=
 =?us-ascii?Q?SB57Yz749thakU53tzn191L5YQsrR3msdZALz7ZRh5tlCbCdAe4fKv4nEwno?=
 =?us-ascii?Q?te9+Bnxm2Sw3xKsjEO9yc9f3B27DssBwuCaNxjbRoBN6Xt2lglyuAbpTh73X?=
 =?us-ascii?Q?gAk938+uX5sUi9jckivJt9UTVGHRitsqk2wVGAJ3vSZCf1F8oB6Bk3iryIYR?=
 =?us-ascii?Q?JFWSd1zT+dM4Lud9jLAPFAMstAl1bIbAcwDYJxAuSVGLFNgnmplErOFFDWQP?=
 =?us-ascii?Q?jLlk36U+QiJ4yJeky9aseFWvSFvnHdZcdoxUvVriToWO2JTgxqZAx9ufav6x?=
 =?us-ascii?Q?w+kcY7PkGiuQR7PNB2IrAYh1pSDWUaYv7KCrB9ApfOLkIisJLuvZa+3vjTrL?=
 =?us-ascii?Q?3zsU58RX/YeVTZrBTKaWgYgGVnKn4+ahqwa9d9nbDDucD4xYsX0/35MLwkwt?=
 =?us-ascii?Q?V+xP5ebEaY/k7o+qfI5jDY8C/YZr6W5R?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(10070799003)(1800799024)(7416014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ymDVBdO0HQGaWCGg5QIoAJzDr1Ns0y3E2e7NumeGjqYpMaARMh0NG8smIjhC?=
 =?us-ascii?Q?7cIUakay5Wy8HLSLnYowlF/QvzHP2eNlrDrkhIZApEGzo/TyjJcmRbSUVzHC?=
 =?us-ascii?Q?6HS/GLC1AO8PYL6sHzJuGRD0Z+6EHktKd1EZEggH9bNAv2nEX3dIGuuff00Q?=
 =?us-ascii?Q?+MMR+u/uCu6LRWUV01mitTjAE/dn1wmpFN3cmt7zVryiolu6pfnnazsUatKQ?=
 =?us-ascii?Q?raeR7whPLFn1cj7PthcQD3g1GtkCOB3MZks30+RlgnvMvReeuOn7NjZ3iFUZ?=
 =?us-ascii?Q?dfOpWa+OPinCQXMKPidyvKEBUm8rfUTD70+ull1OJvE8KFvRYYD5h4jI+qb6?=
 =?us-ascii?Q?q/43KSBS1jNsDUgt7I0pr4TW6OE+OYLwFgMq/bxy1eczw/8KOfG31rwhsPWP?=
 =?us-ascii?Q?Ehbtmh96GsLqBlXkGwVGJ2jMirbQL8qcgw/VGRJXg/9w1MFCDq7BTnXOkEiZ?=
 =?us-ascii?Q?F3/LJE+QnX7kRTcXcoiqJ8VHS1d//1GXjQ5IR6xlqEoZw3NXpXkV17vFTR6N?=
 =?us-ascii?Q?7iPlsfQ6A1fFfZV0e+rEzSiK+jUas/nwMolEps48/nDYJy0oxm0hBN9vD3cD?=
 =?us-ascii?Q?DSTYZYDlQxrQARMwLQKs7siJU/jbq9QQ6C2PyqbCb9OEoHqfgRXF09C0PoEn?=
 =?us-ascii?Q?/GIDRyJqBhtTi1BmPCPLG63vhfk+gWm07JgTQ0ru48nnWclJO0CSx1pnb1zZ?=
 =?us-ascii?Q?db/6mM6RXl8bGi+f1118AKm9yLCWNIZv7jvH5KgvANAY3w9VzOsinscG6d5o?=
 =?us-ascii?Q?kNKmAMaMxXHMpPHwrufRnZBqZ5dlXvVamLY4mQ9ZDudEhNFNvSf1IQoOEuHl?=
 =?us-ascii?Q?cYqDDejDw/67Vmu+KZwMy7918r/lxTTDYkMiiYAl2IKFPXhgUWEGZZSuY9bV?=
 =?us-ascii?Q?Pvbs79vaGCLV7TxQ/aON65xrf5olBkPoBiT5Vs6wStXqf4xwCohnVwXK/B/O?=
 =?us-ascii?Q?yXEBhMxhKKSxqQJElxiPP5Z2yeFlWFPTLIpjQXu4fbuSXo6+BiGmMqfqeqP4?=
 =?us-ascii?Q?3T0+JQHPpY9pJ24dCvsNvoqR+qi+ZzUjYq4Bqtz7d1wvXytLuBEyUcRe5zLG?=
 =?us-ascii?Q?KA+k7/2RS/mcMqXopqIIDUqcrgbp05jjvdvonmT1eoDb/i1lk4l2+Y+zuPRA?=
 =?us-ascii?Q?QT8rKb9Tl3UOKlHDmrp0tIAx6GmlfEr0vDIv0eK6rmdM06nQr1EKKKZC5P57?=
 =?us-ascii?Q?N2/QaqeO8tAE/Hd40i+Os6fjqTqPDxTE6DRuSXlNbhLTKnEXWCVJrJzp5zk3?=
 =?us-ascii?Q?FSAqhFgdpNVptocsdSlsWaEuUugqKG/TlJGVsPpifJCGp49oW76WsCoPzj51?=
 =?us-ascii?Q?ymwuk1wc2XsneObPE3kbbkq7RsFq+loy49rrfS17jvRo4T9DYhf8N4fN6o5d?=
 =?us-ascii?Q?RO5PhcKsaoGt/Im9FXPx0hoX2W1maK2Km0Pkn+N3iarDeMXqEGWpKad1raeF?=
 =?us-ascii?Q?MefXdIb86KOw6rsVUBk5yGKad5VmAfMAFNOk0XbA0vQvtQ3X90WFgz33/uEa?=
 =?us-ascii?Q?7J8J9fgy6LmqeaYyrnkrccegDtnf5A7g2OfjaMYigalWJq7BJp6PnmW1dVxS?=
 =?us-ascii?Q?BCVAgE+qnu5Y7ykR2qnF6BPyTezWIjYFLKdC/g3H?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: dd144617-8392-4ef2-b528-08de3bda20ec
X-MS-Exchange-CrossTenant-AuthSource: LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 13:01:57.6310
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5eYY5ZJ7fC9A8q+Fa6g9ZaGbNXtHEhQR58ZJB5o6uUIP0+A7axRj0Tz4pjggipljJwJIh2P6pCUt7ps9AkVEfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P265MB6508

On Thu, 11 Dec 2025 22:50:35 +0100
Christian Schrefl <chrisi.schrefl@gmail.com> wrote:

> Hi Gary,
> 
> On 12/11/25 7:56 PM, Gary Guo wrote:
> > From: Benno Lossin <lossin@kernel.org>
> > 
> > The kernel only had the `proc-macro` library available, whereas the
> > user-space version also used `proc-macro2` and `quote`. Now both are
> > available to the kernel, making it possible to remove the workarounds.
> > 
> > Signed-off-by: Benno Lossin <lossin@kernel.org>
> > Co-developed-by: Gary Guo <gary@garyguo.net>
> > Signed-off-by: Gary Guo <gary@garyguo.net>
> > ---  
> 
> Its good to see some workarounds/hacks get removed!
> 
> Overall seems fine, but maybe the imports should be changed to the
> multiline kernel style?
> 
> Anyways:
> 
> Reviewed-by: Christian Schrefl <chrisi.schrefl@gmail.com>

`pin-init` is its own subproject as it's also intended for userspace (or
other baremetal/embedded users). I'll let Benno to decide if he would like
to use kernel multiline import for `pin-init`.

The rest of this series convert files to use kernel import style when
depednencies are changed.

Best,
Gary
