Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022089.outbound.protection.outlook.com [52.101.101.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0740333FE08;
	Thu, 19 Feb 2026 14:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771511466; cv=fail; b=IBy5wQjF/v+0lyZAQa+0qCSVwv5jt+JBBEYXkM4/GnF90lFKNaRiLf7rHjmKRrVDx+dsaIRggGbOzndevlGegrNL1qUgMEL0tTtZehqNBxele9rdsbWNX4u4TmzmuQtkTdkGWKgWNOlYreq/5ZuHiX5ChIuy5OC4l5ng+cWYPvE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771511466; c=relaxed/simple;
	bh=rsZibpSoUeDpbGY79RH7Y/MAiH5z+Tpz/HW1SovBhRc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:
	 Content-Type:MIME-Version; b=RT6GmlKWP9p6cmjnF7CYCW95PCY3JPWULGiNkNPra3GHYlqZFp+tR8Wi0PEiFWLQ3UBWUeF7SusK4KrvtSRVarBx035syNURbEyqqwZY0+FhR3gfVdhs0ea690eHMmouODxcG1A+SBAhNB/kBQdureXDUOcpj+RXqNtIdLtQ6vg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=iv/rgjIl; arc=fail smtp.client-ip=52.101.101.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="iv/rgjIl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UYRRPAIKSChBGhd0tn9xmTGawKYVqZ0zzVdGvMBz8tV3lursBBrauzSYxLihooTlU9vvtVOGs9V9c7SZHq9324vhNS1m2t1iHACPeSRmp/RHWEYe/x1s2XqW0X+z+IX6B/YlOwBKf7RjgC7zUP5qqEBVTbRHNaLXk0/uq3wzRRc11mVFaOhUzTW8ctufE7XRmx+MQc+F+b1IsNjdzViZDyteIALriRDVA0YGrl3CGvlwX2iN1gQoFZ0W/KXc5I7jDuk2H7NsGdQipLwjaLXDEkLyY5cisYiXfRdS75idbfZPfX/XIyWv8pfF2oDAfz6mfNlrJ+BEOdy83Udy6jfwnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VecJyEGQvX66g/R8DZItWT+/NrPJwBhJMk6CeVwra/Y=;
 b=MPtplXJkA5XSOyIsHeOkkgyhXseNwMihjv1lFykGct+dy1ngf90Jp60K9Qdf5sonk0zjXB5YaF4plAUcf/ILRec6goquwkeQ3rIc9h+8e9+ogART76RbPY+rKNMG3onZ5VGAzYA86+fts4z6iFRvjtRo7DaAi+3AWRhOY2RQqTEwmjeJKwQi0HxScd1vF/lRqH60vWi2fWqN5cHffzPEDDnfbaD36ViJZJI91d+elU3vMy3iRt6aKtn866wdnih8sobvj0qQmLAmepXAanv84seaWHYlV/lBU1+SdOrdIYjOt4zNeEhLpPTfuY2OL+ZErSb/ceWZQETjjIVQwDI8CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VecJyEGQvX66g/R8DZItWT+/NrPJwBhJMk6CeVwra/Y=;
 b=iv/rgjIlJFJd3ByQLE7t7RBC6oXUdAU8NI/xqEM8Q9OljV9qLMz9MgpDrDwzyFJy/JX1RpMwEP8Bd2WPA8rgfRa8nytEmJiIZN1ufHqxaB3uahMSGIUKcGnifL5KKzfMaD2j2wfNQP3FLOSnqWcAvZNIOTaBVhOSHe++rtHbxrs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LOBP265MB9105.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:485::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Thu, 19 Feb
 2026 14:31:01 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 14:31:01 +0000
Date: Thu, 19 Feb 2026 14:31:01 +0000
From: Gary Guo <gary@garyguo.net>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas
 <cmllamas@google.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng
 <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas
 Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, Danilo
 Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, Matthew Maurer <mmaurer@google.com>
Subject: Re: [PATCH v2] rust_binder: avoid name mangling for get_work[_local]
In-Reply-To: <20260219-rust-binder-ps-v2-1-773eca09c125@google.com>
References: <20260219-rust-binder-ps-v2-1-773eca09c125@google.com>
Message-ID: <360b6d12fb9ae0d532aed17cb788b38c@garyguo.net>
X-Sender: gary@garyguo.net
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0252.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:350::18) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LOBP265MB9105:EE_
X-MS-Office365-Filtering-Correlation-Id: 066ced92-d450-426b-fb3f-08de6fc38183
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|10070799003|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?trGlZiX7wD5v63uK6LdeB0BgCZxkrlT8Qv8xUtsqlHQT+X2RRXS45Zr8ENWn?=
 =?us-ascii?Q?w9Vf+im+rlnvXilapw57foVpacIjsLXY8W41DmB8g2xO/6Dk9QyfK+QlgOxq?=
 =?us-ascii?Q?Gr40VCKTfAYe5J2J7h5UCicYv0mmQt3Z6HX/ArdVffzSzG4+XkCM8CzzXlE0?=
 =?us-ascii?Q?QKyDBuSXJSz/IvEd31LnTI1UCM5TD+yEemdW0lsqvc/vphujOHgbQfoGaNpL?=
 =?us-ascii?Q?PJ0Oa1Mptrg0Q8swiMKHoxYMBpKSDHXxGmpKd8frw3wPb1qeK0aYXg6cY0P8?=
 =?us-ascii?Q?A3qmpXStcZ+PwRujNtGc/77odHh2xz+KQCJ7OQhk7dXMt4sXmqJWLgmDNEBM?=
 =?us-ascii?Q?wR54jhviesqIbervS9beWAx/6sRAlBmR1W80AltTwnRPGmzfLgzHCvjHTYWG?=
 =?us-ascii?Q?KB/M3hvIroGs8FXr8X2dn5GWdtlOYSFTayrRzCfQn9mhzdqtd2zn2wiZjZI3?=
 =?us-ascii?Q?AJJ3yD4WKK1qYvt3+5HU4wsdcARjkmcjY+rajkcd7q7a00sJdM7Tr89QxBLt?=
 =?us-ascii?Q?/FEH9DunKUWh0J+wKTT7tPO81P8XE1H9IUsoY7WaNp+9acCQ+BCb7sIVkVsi?=
 =?us-ascii?Q?mXu5jKh34pI4S6+OZPtBmITE5umGzXiilUZh3LKSarWAZNiTKi9zplGvix1x?=
 =?us-ascii?Q?s5gzTaCe2HOSx3PoW6YNwTbC48lcCZUis3EDxFf7YTU4taEFiWNOy06Yur9i?=
 =?us-ascii?Q?V8A1eVd6MkUSgriENJRdQ4o/Mjkg29AfkWoIb7BE4+hqrNjHYVvaUpes8XQF?=
 =?us-ascii?Q?Bo+uY1h/bHUtP5cPN9KqJ/rVBogq+DCIiP3e63DvE82QBmDIjrFhLPtwrKNY?=
 =?us-ascii?Q?pJuf0ftAubs1k7OKSZd3hOZ38NH5fV/LBIY7e+w/PXSGHLptRZgKqnQb3f3Z?=
 =?us-ascii?Q?vOkjp3HO5BmO2s6D8lW0bNX84BlYasfoFZEWFHExRR/QI0gyE4aEKVCV1SOH?=
 =?us-ascii?Q?RYN5TvE0v30x5m8qfdRf0N0L8rxO3oIxI+si2Oa/Rnhjv5Ac81p6HBWZoGRo?=
 =?us-ascii?Q?P3XNRWrkvDqZgP7YZZfqFi66vD4D4mtFvsXChJQHIeseonUmIajY/LB9YZD5?=
 =?us-ascii?Q?zXhonb9opiMUga4GNywSA6dX+iqz97qxMpQiSX0iPeXEJfLhn9Lrt/ECnwlI?=
 =?us-ascii?Q?8qEVF/RGFbgozyxhqMZske5uRBzGtSpRNjr1DhNTn6LT6jha/9xc5epGTme6?=
 =?us-ascii?Q?+CtyhPMl5khx5f9UjraW02I78+tCrg0hgW7yiMQo7UyD0+HTveHFVCwoQkqF?=
 =?us-ascii?Q?/dBAiHqRhiBmvApkDgtTw2D146N6jkH8THWAF6D/yLMpMKMUSevEuagb42SB?=
 =?us-ascii?Q?y5fOmKvHHnU4OUqrYOFOiWcOqHH+CpLfiT5JWJbkOtwOEmDyGUY6OY6QoC+b?=
 =?us-ascii?Q?1O+ZHVs074MPwYI57j+GV8/JjaXdef0QylzXYAvPPhSrBjengD4qvQqjhTPn?=
 =?us-ascii?Q?QUZvfMFJVJgYoJZZ7WKOEhR6+Wu3IouzWVgJI7gjj8SNrUgNH/JHnxwHo+Fr?=
 =?us-ascii?Q?Hv+lG6pYnUJwEEJYhHSs3cVeJzUdpT+f8q4d6gUXxDREEaVfu+9sNEm4zdIu?=
 =?us-ascii?Q?q8syF6LoXD22w+dWVZc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(10070799003)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qOrh/+suGsPM8fDU8/xG07SCuqW5XexMos1FqU9A66PdLyFvdgOEpEEl7ncn?=
 =?us-ascii?Q?PrGbGtzzdpUzzhFjkyB2vl0zBUODJzQ0qjzaxevryH+j639OYIMHxlNM+h0H?=
 =?us-ascii?Q?yjppTC4xomeZ5qHnvS5F0giDvJr8/zfO+00bYu04BLLCoB3w4kePPPMYYH6N?=
 =?us-ascii?Q?u/C/AyTFW7pMR+5GWetplM8roEgz+sGfsqtqYV+6zTY1f7LE6mSbB1+6QJJT?=
 =?us-ascii?Q?WVFWhktryNUadAHbWYhGOHD/J8KllTOeHIMgH1DALu3lEhOJMwt8ei3caZY6?=
 =?us-ascii?Q?3QQk8PVGISFj7sXw7FJOk87MOLmIayEO6reZzL5DZbcM95UXOkCkaGACg4pJ?=
 =?us-ascii?Q?BVQNbgCAuFk6IDTjDx9n9dlFG/uAp6+S4DuSI7Nv0elOjvw3d7JpK1ivMoHM?=
 =?us-ascii?Q?cTJrwp/RMCMzYv0WritaQkt0scLg+cMx6Pjyu/Bg5jorBrv/RbveB2zDsxzW?=
 =?us-ascii?Q?EfirNNfT4AjQHTfdE19e6UMyQwdcjlXbSWmA5hn0/o9aUUm+W7UCCHa+ChHn?=
 =?us-ascii?Q?G7413DGxMUpdN9h0+KsbfStSTE8wMLRChZaymkbBMtWoiUWQPg2UESp37t3p?=
 =?us-ascii?Q?w5+nRdhYgCpwKMXSE64br1aeL71Kk7gF4PJcUxMDqJ+VMcwsGcbWcIas4UNn?=
 =?us-ascii?Q?Lz+diLZ4JSf2sgLjF1Sc1TorS/hVtlaFjie2dCUGbXqYHtz/69P2Wh1/q4GE?=
 =?us-ascii?Q?y8BC2+FvKKYye5Leu1oMhLQJhBz1fgxNGMdIwKT1em3HX0xd7SjP7JZrl6ZJ?=
 =?us-ascii?Q?+OPsffTkXonpeJSH/ddRsQMD63hsnq0ZN4RobFVNzru6n4IKiidEJTXfESrm?=
 =?us-ascii?Q?sttqQhw/vrOMIMe8OyyZM1nHmBOCkQeBpNg2XeO4OA0ZUO+mD947taVDUKHx?=
 =?us-ascii?Q?gdTOlW+mX+cw0ajccn4HKDj5JCCTxoQMKfEFbIlOEkwXgqPYqWHtdSZNfAqh?=
 =?us-ascii?Q?8ycrTHG9GFHE1T6DnwcpyMZnW0EatluFaemi/mB4/mKx3EEgIGTH20a8lerv?=
 =?us-ascii?Q?JasvuJp+eha/FHTT0GHyr6wfKlyxXac6/hKUb6LPO3qbHNavq/A1Gkh7pu5V?=
 =?us-ascii?Q?F6rZgRGllY9X5goOAtmCU2Zcas75FHsTBgOfs6fsyg/U0sC9RnwLpf+IyzZz?=
 =?us-ascii?Q?r4wm6FKLAvEKSBBEMfgVNwjNvd1hawDLQnKsUoSijwPgj51kcsamwWYRtw+D?=
 =?us-ascii?Q?z+V5sqywDi7Y7RRJdxGFvKutzhna85VvNLIdVOIElcDh2GTSDDhWVyhG0aGG?=
 =?us-ascii?Q?0oO2OkFI9exj3yyhKs1ItcQpzEGWYShJ49YDbJjpvZbbuVUBha2cEtNMWW2z?=
 =?us-ascii?Q?PYpay/eNLV54c7IHixnWPFcCApttAAobPyrsQLsLkcmbHm1QQ9RdbRsKlAet?=
 =?us-ascii?Q?8V1ceLd/53w12+8wDi4FvOu5V412fXh+Az1rLANwZoum3sS2eqCAeQx+muo0?=
 =?us-ascii?Q?FNB4vC07jpdx7jN+3/1c14+/rQXe9uPPdf49dDxknWsXOIMHG0FajwWsPWZa?=
 =?us-ascii?Q?WA0EfOV7qAPxI6JA3poy9QgbhvnIwIvkYuizpKcoRSeMl9AwpZdGy/feWzXB?=
 =?us-ascii?Q?JLunR9V3lT+vXewuTH+w5FuKtY8R6esiS2efT7jHh4z2jMM67WP4FXOis7Ry?=
 =?us-ascii?Q?857ezxEf/J3aHjaEi+LQ3afUf6M9/+7yLOIYBfb/XuOg1gMY5ZskrQh+BCoR?=
 =?us-ascii?Q?wTOplWpKAJBZ4XoNoZ49qNSiooiqrPTU0Z4oxCJc9houELedvo7jjijgZToB?=
 =?us-ascii?Q?4QZuQBFLcQ=3D=3D?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 066ced92-d450-426b-fb3f-08de6fc38183
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 14:31:01.6377
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bbPTqau9ReOGwp7UKPWAUvLExOEUaH7yi8D6gQhM6Lbi/Y3hjznGXXOs+ZCIXhWCIobb60JgTj+SUT7pSutWBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOBP265MB9105

On 2026-02-19 11:27, Alice Ryhl wrote:
> Currently ps -A shows processes waiting on schedule() in functions with
> names such as do_epoll_wait, wait_woken, and the impeccably named
> _RNvMs2_NtCs8QPsHWIn21X_16rust_binder_main6threadNtB5_6Thread8get_work.
> 
> To improve how ps output looks, give explicit non-mangled names to the
> functions where Rust Binder calls schedule(), since these are the most
> likely places to show up on ps output.
> 
> The name of rust_binder_waitlcl is truncated instead of using _local
> suffix because rust_binder_wait_local is sufficiently long that ps 
> shows
> unaligned output.
> 
> This is intended to be a temporary workaround until we find a better
> solution. Adding #[export_name] to every Rust function that calls
> schedule() is not a great long-term solution.
> 
> Suggested-by: Matthew Maurer <mmaurer@google.com>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Acked-by: Gary Guo <gary@garyguo.net>

> ---
> Changes in v2:
> - Rebase.
> - Clarify that this is a workaround.
> - Link to v1: 
> https://lore.kernel.org/r/20260213-rust-binder-ps-v1-1-6b90f83c0b4d@google.com
> ---
>  drivers/android/binder/process.rs | 3 +++
>  drivers/android/binder/thread.rs  | 6 ++++++
>  2 files changed, 9 insertions(+)
> 
> diff --git a/drivers/android/binder/process.rs 
> b/drivers/android/binder/process.rs
> index 
> 41de5593197cd29b71d1cb49829a1ff878bab249..f62f626f928e7ea4965d03c92cc988f344c6ae81 
> 100644
> --- a/drivers/android/binder/process.rs
> +++ b/drivers/android/binder/process.rs
> @@ -1442,6 +1442,9 @@ pub(crate) fn drop_outstanding_txn(&self) {
>          }
>      }
> 
> +    // #[export_name] is a temporary workaround so that ps output does 
> not become unreadable from
> +    // mangled symbol names.
> +    #[export_name = "rust_binder_freeze"]
>      pub(crate) fn ioctl_freeze(&self, info: &BinderFreezeInfo) -> 
> Result {
>          if info.enable == 0 {
>              let msgs = self.prepare_freeze_messages()?;
> diff --git a/drivers/android/binder/thread.rs 
> b/drivers/android/binder/thread.rs
> index 
> 0b62d24b2118abe10577029a0129887e4ee8c6ba..6f197be0fa75d9d485c6cd659fa28c872a88af93 
> 100644
> --- a/drivers/android/binder/thread.rs
> +++ b/drivers/android/binder/thread.rs
> @@ -513,6 +513,9 @@ pub(crate) fn has_current_transaction(&self) -> 
> bool {
>      /// Attempts to fetch a work item from the thread-local queue. The 
> behaviour if the queue is
>      /// empty depends on `wait`: if it is true, the function waits for 
> some work to be queued (or a
>      /// signal); otherwise it returns indicating that none is 
> available.
> +    // #[export_name] is a temporary workaround so that ps output does 
> not become unreadable from
> +    // mangled symbol names.
> +    #[export_name = "rust_binder_waitlcl"]
>      fn get_work_local(self: &Arc<Self>, wait: bool) -> 
> Result<Option<DLArc<dyn DeliverToRead>>> {
>          {
>              let mut inner = self.inner.lock();
> @@ -551,6 +554,9 @@ fn get_work_local(self: &Arc<Self>, wait: bool) -> 
> Result<Option<DLArc<dyn Deliv
>      ///
>      /// This must only be called when the thread is not participating 
> in a transaction chain. If it
>      /// is, the local version (`get_work_local`) should be used 
> instead.
> +    // #[export_name] is a temporary workaround so that ps output does 
> not become unreadable from
> +    // mangled symbol names.
> +    #[export_name = "rust_binder_wait"]
>      fn get_work(self: &Arc<Self>, wait: bool) -> 
> Result<Option<DLArc<dyn DeliverToRead>>> {
>          // Try to get work from the thread's work queue, using only a 
> local lock.
>          {
> 
> ---
> base-commit: 2961f841b025fb234860bac26dfb7fa7cb0fb122
> change-id: 20260213-rust-binder-ps-46d9d060243a
> 
> Best regards,
