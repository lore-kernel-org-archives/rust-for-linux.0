Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021141.outbound.protection.outlook.com [52.101.95.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE44023EA95;
	Tue, 23 Dec 2025 11:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766491054; cv=fail; b=iq/xWuPwzjZzIcN3u0FUUhtPaFMKR5aoQfhmYFDXS+qI7aGBz1Lp0tqAenb+nVse6otEM/ClREKzUTz2qjzriIJMYAOc/7eXMRP//AGwLEZcU7a2CKIwd3mew+kHI+fRKIMDs/ExwzdG1c7phS6bQp1CiSR3gfgpLhcnUg15mGA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766491054; c=relaxed/simple;
	bh=LI552RdZj0JXvNEEoLW/tDNRlIwj2s3rXg6Oxulukpg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=F6er81N2HpVyJ8G1jWSiOvhgAVFAiHPN7b5Yl5uqnZ82bPusdLqkgOV4+nnBWpj6JuDG+/eV8L37QylkvmwDkVrTZjVwrZMpD9wgr/JQx6uefwcZgpUNqYrdzm+MZckmvyGa8/9LdjWyHUwYCjFeQdp5bikLnLI3f4bXh5cjVLY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=GeIX4C3b; arc=fail smtp.client-ip=52.101.95.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="GeIX4C3b"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hBABs1UbQKyFSzWcUaXhz3xAOEXm1EROiyUOlQwXiJmmKA1eNtZZFN38comh6sWJjA5z6P5fd0nRe32iuUvIOe6u/Rm+x0b9mEtIEnel3N0kPiATDZAUMR7nvOIyAieTHdRNeAYBgASkN06NURjJ+VTPU+NgMTxgSZ7oBRVctut34qmTm9hcLCXoMGXKKysNI04zlcV+5PwQ9oo53FXaoDBOt0SyIuDyOtYrEUW0kraAi+iIcR90cklUd7+6gntUsnwmhrymgMyDY9ojowDqmz3HeaKbIKqZj2OhDXTE//+sDTn/4JburqtGJGpv5Zv8fp5aBEEnogOuqNN0ZpjI7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iiTWYycyDx8A5kBs5qprEkRZJkxJa4rHlB3TgQ+7k9E=;
 b=uHOh7DCOQ7OnBhJASSJIM7+46X6GERl4g3/EjQbxgne1edIGqacCy21y7Z8UiLG235QzY2fLLql2z1ITJAOUvesIIiH9fPoJXD6gYbmICljg5StaYk6S+zgp76U0KhukoP+x/bpiRkN0ymOFMVS0di1GeH3ZgQiv1tsISGjeyDmOD2HwGvPBxjKxpQWImKCEK/OXGG6QAPydorUNNv/Tdngu6iERrWu5zjZdWj9S+W1f/L5tz/Iab70WX9ULVMHnKPQGK+LRZMH+7rVtFwdU89BMk0S2NOLmJS0aOHOgj3KoEiRJ7PT7RcEjWUeqEjr2J1017l4SKw57SurnseDVLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iiTWYycyDx8A5kBs5qprEkRZJkxJa4rHlB3TgQ+7k9E=;
 b=GeIX4C3bzDWTpRaKIoCkLOInecfaAffYl5HhMN8ZajBPqujMsB04Bl/TfM9JIDjD60GyFCyYmkpIecI9rg6GJh39enRj0+bIIBPwvU+5gweFllLDQAknykpZS+bW08PhWGoxtxBbZpXuZfktYLXVKwkfwbXbD/hg08jIMf5alKY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:27c::13)
 by LOBP265MB8416.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:46e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.11; Tue, 23 Dec
 2025 11:57:28 +0000
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::a825:7b26:a82f:d041]) by CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::a825:7b26:a82f:d041%6]) with mapi id 15.20.9456.008; Tue, 23 Dec 2025
 11:57:28 +0000
Date: Tue, 23 Dec 2025 11:57:26 +0000
From: Gary Guo <gary@garyguo.net>
To: Kari Argillander <kari.argillander@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Dirk Behme <dirk.behme@de.bosch.com>,
 Alexandre Courbot <acourbot@nvidia.com>, Lorenzo Stoakes
 <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 =?UTF-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin
 <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross
 <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 linux-mm@kvack.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] rust: page: Simplify overflow check using
 checked_add()
Message-ID: <20251223115726.621bfa38.gary@garyguo.net>
In-Reply-To: <20251223-rust-page-check-v2-1-fba3dbdde1d8@gmail.com>
References: <20251223-rust-page-check-v2-1-fba3dbdde1d8@gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0499.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::18) To CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:27c::13)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CW1P265MB8877:EE_|LOBP265MB8416:EE_
X-MS-Office365-Filtering-Correlation-Id: b42e875f-198b-4d49-8641-08de421a7216
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|10070799003|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?35lH76q64Cqb5qy9YtfDkvJXlajL4qbm0VjOS2jrXaQkIddWuEv/m6MLA7rx?=
 =?us-ascii?Q?VDrnzloViTYexzHfOyXkOF0qw7FBCqps8adv0RIA046mVkdt72khIO2WmDws?=
 =?us-ascii?Q?xzWw9rGJzhKIpxn8dFBFdQpLtYEwYOZnlI0eCj5DRahYtmcv847kAeNYAjzE?=
 =?us-ascii?Q?fWiEpSIggwxz6MBH1AU5wCx8VgmBFKMNpMkG1kZHp7oJko1hAwETxeDWjRgw?=
 =?us-ascii?Q?CQPRGfr14hkdseDE5/1WMUAWlzezO6qt9ul+S749MdGEv04oUhUEBobu6NqH?=
 =?us-ascii?Q?KmIDGAmH+KsXicfXVWbkFmQlZNLXLaIS79nan9yIvWQEiivP+KJYyh21CM1I?=
 =?us-ascii?Q?UNIKSQLZtbAMg5cnKMYCTStEjodjOVBfos3qnxCGU0xugCnrtaEcAg93/Qug?=
 =?us-ascii?Q?zp6W0AwIEeiBMkR37WaZbq1l7IfUsrytiJgDUaMF4Wa5MHCSBChLR7rMDa3j?=
 =?us-ascii?Q?Ooyt2CFciUfB4mhKpqZWvf0lDkzoaFQOxCtfTPN84B1f4lBngN1PBhfIRP81?=
 =?us-ascii?Q?2QrppzNdw1zuoffLMGepdk0JGrhRyHerlvGk+sws48qTuncaKdTOuHF6igzK?=
 =?us-ascii?Q?1ga9nz9gsBOoUD2IEre4JO8K+s6dIlXjbAmBzmRWso6CPevGFX8TgD5ZAOsV?=
 =?us-ascii?Q?rMLU5iGOvQ09Mo0nqJ3wS5o+xzjPVUaYv5bWADafJClKjbEZ9q0WyZrfd1qR?=
 =?us-ascii?Q?NC6mwMpv31mbT9cFDA5UbM5mwyyY1D+m+x4IIQarSq/xRyTIVeVyeiHeuL+6?=
 =?us-ascii?Q?8S7WmoTPnuj5DPAbzdru806x9trC4wG5GRUafjybS0Y5abP7RNglPIoM94pI?=
 =?us-ascii?Q?b1c3sycsZa1ZbcRP+Xx1zJfP8ifMlrRgkgRTg9D/T23x+f4oweW6LXPYBBl7?=
 =?us-ascii?Q?YJK8T4a+w0zTLH376kHDcC8+xp0AKLPbB1iftiIs7KBukYA20rPn2SlP4izA?=
 =?us-ascii?Q?RuOicybhi2hD5mVWDThOJRUe75EiGkH8NxhuGPHlC1ao0ue95kSU9mzeXYxt?=
 =?us-ascii?Q?1h4XWnX+UKs988tqMJhlERSDdpy7jljuXmcSsSK0cMgUiUXGPdxGlxrv1gw8?=
 =?us-ascii?Q?X0omj4n5PteOOYxFKoXguqJNFQjeqZJafv+SWqrovhzxOvOQWVrLkiDixfrq?=
 =?us-ascii?Q?m6Mnizx/HP8romN3BXrhTCcShlk8ytbSJn7u2jTffw6n9xS18tdD/ActMvO0?=
 =?us-ascii?Q?KXBwVKYFyRwiAFtsBG8rfPvR3S1Ov0LvoSIwiwlA3Oo5LYMpfNKze+I44TZ1?=
 =?us-ascii?Q?0TgzL1K9csUhC0I8ZmKes2hf6NW8OzqqhQkkB9SpN6muT/T9odIFedTI/ice?=
 =?us-ascii?Q?Y62BGNbLwCn10gczF7G5661uospTYlD5iES1godpueNcPef3AVEGBCBVgEFm?=
 =?us-ascii?Q?XP2IpKnAqgpOnRUF5GqC1u1B1vrSZrocB78l9YYkYIt7uJKVzK0Uq/t9lUS1?=
 =?us-ascii?Q?3zOU+BxVzBl1SauwE1uFddOmTL0SYvY4K7L12nXjh1wgEfoUwALwJg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(10070799003)(7416014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+litAeNgOJ0FYFV5d2M6Nc95++KhKfHtrk7h/C6eSdzOoDLut28y0eqRvp5T?=
 =?us-ascii?Q?U45hGCn+aMPSv12tU37Bly3LZroeSmHWt6aSVJ8ys6LnqDQb4+cFNUtWk3m2?=
 =?us-ascii?Q?23cKzZYOUom2De10dhPJVTULDQY9rBBY9fSX/6mPMs6HijaNnQFzZsYQsotI?=
 =?us-ascii?Q?QEL8cq13YVrpZIF6nJLBPjIyTou2nVqrHRJxQIIUCKQkIaHq9856xOrqTUVz?=
 =?us-ascii?Q?h68raIkGzZHsm+4D+0+ladEVbJ/Qio/MJnVxtLb6kC7MeCsZG51Ns7alphRg?=
 =?us-ascii?Q?lHFixI6uihr8d1IyDA+cenUL2Z6xWuFRAl8WZyXRWe7Swux5JXp9YUn/5Nfh?=
 =?us-ascii?Q?ObTbfN9FNcbeqqYVkTLaH9az3+ewwxG/b8YkMm+/PFs7WuXdapwSnj98ZSpP?=
 =?us-ascii?Q?p9EoshVH237+0Gudw2yVSrR9nBwxj0/gYniWz1WHP0syuq0OKvHtxpSJiZlb?=
 =?us-ascii?Q?0fSi+FQuDm9SUfhse4kw6QNlN2f/hQbzCsITMd1X+ufL9ZE6O26fl6bLQaFm?=
 =?us-ascii?Q?VOpvFAd1HCzj1bzDf5xM6w9lOTUEA7jcYLosohsAV5vaLWfXKDKVvcjRC4L6?=
 =?us-ascii?Q?Abv3dPJTNlUmcGcVk0R3PDbbtR5f9pobyZGvhH3MMqjErveow1BLEOtPcTIq?=
 =?us-ascii?Q?P3FCifCzVyiupnv4GF4n4wxAZ9dOE7359w4LDHW6piHxrN48AgMtMY2zCHZr?=
 =?us-ascii?Q?sTXthyTaBJPEwHfv3sioDsxjdhl8GFKO9pjgXAHVSgEIFRJPET18KdAcnsi5?=
 =?us-ascii?Q?pIAqaIcrMUhuPNMYVO4VMYS7qNOJMQoaJ5vte13DLgl/G2Nzwk9Ul//kaC5q?=
 =?us-ascii?Q?QKnd2qg7fT3KO8W1EWuXw3ITIw4k0CSMyJwKSUAi6rwfI27SRsYI75Ui0mmZ?=
 =?us-ascii?Q?a2bb4qLRpTti6v8zIkp/U4w4wapLbZ0MhNixbJIO+S27dhiV6fghxQW4Cui4?=
 =?us-ascii?Q?+Mgdg1/XeEGmnHKPV8dQilkZGF8hkbII4uCVlPX80OMr0HgVt1FQnPzgAFym?=
 =?us-ascii?Q?h7ppbn2XZHV0uMeAISbbIWD81IASeutLXh9TvAL5TLNWN0aVO1RqOepQooQX?=
 =?us-ascii?Q?VvNwMmvzgVxIrXyXjzEWt2SGi2fqhRq/M52zJiPzSl7C8Y+AOhY9QAoXO6bh?=
 =?us-ascii?Q?lT2XJE1v9+1hdO5FzpPjAMnZTONJKE2GZgnuhfWK7I80GO3m9MK3/wO7lWX2?=
 =?us-ascii?Q?job7vu2DBu4NkrO5WfcHsdKfCf9weDn1K9Tl55e/faQKV6lhtxA965WhvtNZ?=
 =?us-ascii?Q?IAW0J7mS96ua4+d2mb1DPoeGtXYwwKQJRa/7BQUiQC2BQXq+bxtaEIvn3KqH?=
 =?us-ascii?Q?k7MvHIXF9/zSuSiev0gPkMenDMLh2vUBp1EwLTVnlveRjzSH5jzBYN+NacQJ?=
 =?us-ascii?Q?vE5yXBG96xKEsrE86cSyhDkrKQrDvAZAj+BancUBEoZVAyMAuLGW2gfnUjzp?=
 =?us-ascii?Q?IKqQHacSJXqI0KaTe+oSKDs8/upDBVhENwv52OGaYMc2QQrxmolIScm9p9/v?=
 =?us-ascii?Q?smPabxtLqE2+bdoYNlXff9b8oUup6sVsMV/keRFiqDseuj2Yn0kwPD1sK8Gt?=
 =?us-ascii?Q?OEyChFThYEWE5MMVNh/DajCjBFHgUhQ8X9jKCwq27chsLCA/4M7XJoXZLbCb?=
 =?us-ascii?Q?JCn7oEimprlvaZOkbbfSd5v0nMnb7OchJsFioWPpPuuT1UUWZMJXfX6lcKqp?=
 =?us-ascii?Q?tN2vVwV4mniuNDFhr2yqB1RfSPEBySBnaTUbwFOY8NYHxkZnEpx4FknUVYrA?=
 =?us-ascii?Q?yGc4GZvF5g=3D=3D?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: b42e875f-198b-4d49-8641-08de421a7216
X-MS-Exchange-CrossTenant-AuthSource: CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2025 11:57:28.4937
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mp3tTzFSzLFyl3udiYKXqrXOd+2yJmOurxSKUnsW1nKvb8mBUuJL/CdqLyJ93npkhmSlP6a3VqwLIMpB7cTkvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOBP265MB8416

On Tue, 23 Dec 2025 12:06:17 +0200
Kari Argillander <kari.argillander@gmail.com> wrote:

> Replace the explicit bounds comparisons with a single checked_add()-based
> range check. This avoids redundant comparisons, makes the overflow case
> explicit, and results in simpler generated code (checked with godbolt
> for x86).
> 
> No functional change intended.
> 
> Reviewed-by: Dirk Behme <dirk.behme@de.bosch.com>
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: Kari Argillander <kari.argillander@gmail.com>
> ---
> Changes in v2:
> - Added MSVR todo (Dirk Behme)
> - Link to v1: https://lore.kernel.org/r/20251219-rust-page-check-v1-1-df2e52fa3bd5@gmail.com
> ---
>  rust/kernel/page.rs | 19 +++++++++----------
>  1 file changed, 9 insertions(+), 10 deletions(-)
> 
> diff --git a/rust/kernel/page.rs b/rust/kernel/page.rs
> index 432fc0297d4a..cd2af7e4c357 100644
> --- a/rust/kernel/page.rs
> +++ b/rust/kernel/page.rs
> @@ -239,17 +239,16 @@ fn with_pointer_into_page<T>(
>          len: usize,
>          f: impl FnOnce(*mut u8) -> Result<T>,
>      ) -> Result<T> {
> -        let bounds_ok = off <= PAGE_SIZE && len <= PAGE_SIZE && (off + len) <= PAGE_SIZE;
> -
> -        if bounds_ok {
> -            self.with_page_mapped(move |page_addr| {
> -                // SAFETY: The `off` integer is at most `PAGE_SIZE`, so this pointer offset will
> -                // result in a pointer that is in bounds or one off the end of the page.
> -                f(unsafe { page_addr.add(off) })
> -            })
> -        } else {
> -            Err(EINVAL)
> +        // TODO: Replace `map_or` with `is_none_or` once the MSRV is >= 1.82.

I was about to suggest just enable the feature gate, but turns out it was
only added in 1.81. That's a fast one to stabilize!

Reviewed-by: Gary Guo <gary@garyguo.net>

Best,
Gary

> +        if off.checked_add(len).map_or(true, |end| end > PAGE_SIZE) {
> +            return Err(EINVAL);
>          }
> +
> +        self.with_page_mapped(move |page_addr| {
> +            // SAFETY: The `off` integer is at most `PAGE_SIZE`, so this pointer offset will
> +            // result in a pointer that is in bounds or one off the end of the page.
> +            f(unsafe { page_addr.add(off) })
> +        })
>      }
>  
>      /// Maps the page and reads from it into the given buffer.
> 
> ---
> base-commit: cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
> change-id: 20251219-rust-page-check-819ccc39c53a
> 
> Best regards,

