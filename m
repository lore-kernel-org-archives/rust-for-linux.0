Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021128.outbound.protection.outlook.com [52.101.95.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208A135C1AD
	for <rust-for-linux@vger.kernel.org>; Wed,  7 Jan 2026 16:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.128
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767804842; cv=fail; b=gHC5X5N1EY11FNC8ve2q2SUJ6JAVZYb+lPa/jFnIePZVpDKWaPg+0mCe5FR8zv/H9musKWz4TduEiVplYKgvkGg12Le++mf89ULg54SkIy+yI5fShmUzqvxNj2va6WPLjD5n+A4lusAAIeQ7M9TRLQqZ+6kBgFujcK/qRhHsouk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767804842; c=relaxed/simple;
	bh=XE1P6f9x1YZKQZg9H5J/a9KYcoshOFqzhidbVWGrfIg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qA+bpLToYPKkAKzjYCdxHtTqUI/MeZd8FC06U60bqG8bN1XtW4fOBrRXnchenvHL4ekUTIIzuNyH2ioJb4D7t1Jq5xlrMUVCpExvbRz50TSyL0WAOqqhEqpeKfuRsbzNlPkFwveD10YPR1PfczIVetAcVe9k+ffzNh1KudUFiWc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=X5xcAOPE; arc=fail smtp.client-ip=52.101.95.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="X5xcAOPE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t8Ie+flSthtobHWM0lThNnr5V56HQMwbcM7dVK8wSgi3SbnIGBO/o34XlF6W4iOLudfu0lpyd6vqyJrukLQxW5Z3PHe18R3IZBfG5OVj2CqJePia5+fdZU2LnMbPJnD/Ig1PlohNfgX+MhMr/lMIMC/pLTeb25xNcIxoa+2bO/eSnZybdebu65MhEnLtp3+eAwHyjK6p4JEXt1+QS9W8wp/9Gm+iPyo+31jTvIJ21uy3viDgNpCPhD4oQPs6+LPtw+BJk1y7JvWBX8szVztNb2gbZFY6QVtBC/bpv3369eVO3YJ+p66JAoGV8plyHUjGr+Tox8KibEtzdE3dfdZDiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RaBgoKOfeIOJX1zkxg7yehS/8uJffbCY4jWQM7lW0rQ=;
 b=ru+EhvqIPnwgeWq1QKVk1cUHALyLjh32hI0NLrRsHPMOqJH5NF23OUu3vNydC1QXXgFxIz759UOrMvqW11Mn6ENAvBrjOePe8v65Qf5hBtn9W1wRZBSK2Xo3JsnolzRfYA2KAcxeiF3sxUsNJo/CxLh+s7FmYflVZnndWeR59pzhiUIun7QMXSsaGcibCy05FZK63U0jRB1LR8BELpP8Od5WTm0gMInwMl1KqvjN+TdjaUOJGUWzr91Y0krvgNokbc6HbjJfvpZE9QGInVYdgE/HFC5qwUkwMsy64CnhEv01Vsh6CcHX9BnlkqPrvmNE6hdjXIfT4kWdStMT7T60hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RaBgoKOfeIOJX1zkxg7yehS/8uJffbCY4jWQM7lW0rQ=;
 b=X5xcAOPEpIVOdWP4HrONv/xtR6kWmi9v5UjnGCGymvghXANCzEo6FZJo0k6Nu7bRI9yykGtH9H2h9KJG/vvTK5sl3tpYurscE1piGM3k1WYD6bK2yzSRuhUyLUW9w/wi/JdXClhUf390lLGbj0AZ4SoiyJecFiA6SlPHg1vo3oo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LNXP265MB2441.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:134::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 16:53:51 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 16:53:51 +0000
Date: Wed, 7 Jan 2026 16:53:44 +0000
From: Gary Guo <gary@garyguo.net>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: ojeda@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com,
 bjorn3_gh@protonmail.com, boqun.feng@gmail.com, dakr@kernel.org,
 lossin@kernel.org, rust-for-linux@vger.kernel.org, tmgross@umich.edu
Subject: Re: [PATCH v1] rust: bug: Support DEBUG_BUGVERBOSE_DETAILED option
Message-ID: <20260107165344.4e928ab4.gary@garyguo.net>
In-Reply-To: <20251204223405.454920-1-fujita.tomonori@gmail.com>
References: <20251204223405.454920-1-fujita.tomonori@gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0374.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::19) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LNXP265MB2441:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cf43baf-eaa0-419e-b0ce-08de4e0d5598
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|10070799003|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Xd+BVeLq4PBotBBV98KZR3nrU2S47NrsY+43jvB/lBBWjusESuV63h1WCNHn?=
 =?us-ascii?Q?4MZ/FCTF4jiDzs0ekHdxA1RpJVRr/FmXv5ztEsJSEcO5+IYutFD6lvqTcwL3?=
 =?us-ascii?Q?uIyvTP8GTeHU+orQRPzV11A8Yy1tx8Yj+veHk0lwv4/1ge6ADzORugdmveNW?=
 =?us-ascii?Q?U9Lj5yk7G93LQ5MldQiJEJYSh37ulNqr3O+xlZ95j6synBaPUYajCgsbxJIJ?=
 =?us-ascii?Q?ryVl7bzn2/z+rXmncnUDb9ttPSmn+b8LikrHq7yTJxyuVJmQvnzb5CIUzgvD?=
 =?us-ascii?Q?RWM26ViPgp/8UE7Mush7B3hZ9RtPldpmGLHXN6bIAui8h1RBZCvpgXmAJXYi?=
 =?us-ascii?Q?52aJ5/8GwVbgVo6Os3/EqTDk1ubiZydY1yJaGai3YbmPwGVyCSSeMxA8o1R0?=
 =?us-ascii?Q?OR8iohdH3Q/5CzKwUNW3L03iWV7SOeWeFQVZMSxvgTPjCZ3mEjEiTaVuqKfZ?=
 =?us-ascii?Q?sjAwcHivpvRQ6y67DE3ZTk8DaC3cdGlHr9v7Aw+WMpGmsmdZLUsn/o8SLG2q?=
 =?us-ascii?Q?AIkIBSJyTI7ncMKCNbESnmMlSDnxxX40uIMGw58NaIixSpcXgYR7O5bcQk6w?=
 =?us-ascii?Q?cs0iNN3aKB39BAlbD0ZpM2sfVQJ8/Xf5uGEujuXN0ZF6N+ex/Zxk6el0VHCV?=
 =?us-ascii?Q?/ERIUsFEQv5Of2cdudweEXN2lK0T7CjRtIEoCy9L6aFaqXfYnRWQ9qtXfxgw?=
 =?us-ascii?Q?HNyedUNzenmq1uSZHxcV8ZXUaHe19xgCUB4XRRmkh7+S34zNspCndEYdks8l?=
 =?us-ascii?Q?SDfCPaJ8E0w1wSz6twVxNv7liU79rUOeBOoiar33FGwgEFVge9I+EuD5YvSG?=
 =?us-ascii?Q?SRse2sD1SVg0h9jr8W+BqoMRaqr0+eodi1vx8sO3rRHMUL8eljS7dJDFWUEq?=
 =?us-ascii?Q?oSM+g6aVdQpkxlwLZ2zGodFCqSSJD2QU8BVQNxjplHLb44iMcilCYxF30zSd?=
 =?us-ascii?Q?R2WJdTyg/suTWRPBtrXs0WgyD1YF6trgjahZY0RUiqX0J1hOcN/rmKxPwoHF?=
 =?us-ascii?Q?kh/j5lAJO//wgRvT96P2Gab+/XLwYWYbepo7rBqOq66961eluXxMEWoQI2Or?=
 =?us-ascii?Q?chJlXdoXfOQFHe6HZ8t4LTYeU72XXt+o7aCA0BJjDEJE70rX4vSrAvcU/ZvT?=
 =?us-ascii?Q?KY5rWtxaq46D0udifTFkk6U2lLghWM6/tNQEVGDflHgmfZ1p+XQYysTzclUU?=
 =?us-ascii?Q?C5VGI9LJsSN02VzDSytuKtTGowBKjVw6gPS/349BfU7krOlLU3kR/5UErLfG?=
 =?us-ascii?Q?mT4mf1QqWTF2fse2Dug9G7EG63uUus6oBhZ2bb+U5Sa4qHUQD79Mx176hEmg?=
 =?us-ascii?Q?5kE38YN44PemGLbaImzawoWWD5ifwcufV5YeXLILRNAwz6F1XurGNAKOhFEn?=
 =?us-ascii?Q?z/D41Fd4cY/9RfZjDWgH74dG+7+UGae0h+VZmtY/gnPxI4zx87w+z1DP37vE?=
 =?us-ascii?Q?fakMdxtpA+MhIoB7Yjt52mPGX9u4/A8V?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(7416014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ap+tuTxBH686aQUtLAOoNEg0LqT5yV/1sK77NNsLx/hfL9CMuLpQewdHKTsD?=
 =?us-ascii?Q?VLl10eUWSpKZtfk8ge4AhTY4ad/iGTAPulASX5J1Ft34Y4ZREAMVrB3+bSHP?=
 =?us-ascii?Q?GbCnU5LrYJBDEpdXwqddhSAyucEt+WuNrR01LEVZFze9F0VAKyNJazFDA/qS?=
 =?us-ascii?Q?Zml4Y1dUBZz+Ol3XFUeI34pz3PCurKVUNnj70c/lPqLbmehp69mD184kBT0N?=
 =?us-ascii?Q?wgZ+Wscegu1XZkRNj2zqiswVm3RZQCgIppduQ0bqoC1tWspkQuF8/ISsXY5G?=
 =?us-ascii?Q?j6qQ2/Piq2+rm6YZQeE83SlgAbln4WugHrsUHBeVaeyvqlRRe2ZwVaT0fbQI?=
 =?us-ascii?Q?BDJ94rvc57ZyZ61BiDpFQh9x5fvTa5R0Cz0oJ8SUcY8C1oDx5fuCiz1+8zsv?=
 =?us-ascii?Q?z6dnRc543Z9jCncEiArmpKtN6lJNRSfOAouTv624O38e3PVOjIAIz2s6LVW4?=
 =?us-ascii?Q?8g/+AZFIeDMDpbYO5zoNQSF5iJacnc08H001VtcBbWjTmdS420xTF7MOZbKa?=
 =?us-ascii?Q?OzsrSWEutwhLQZ4OkHVNVVaTkBGz5AHfzbKgYGNoqqc9eJYZ5EnuoB51q/VW?=
 =?us-ascii?Q?2Rj+dckv3kV+a5eeogpSgHDIVcvIqHAvfj/TIqMpAQYrkuqtpOx9GuuzSGvl?=
 =?us-ascii?Q?gIxSMjdK7TZ247bP0lkA1klJpjMzszJ9HHjM0Jm5wgfHzAiOZ+1qBBmQQI8X?=
 =?us-ascii?Q?i14sJurHPR2L6z3tkAMLjEXh2Q12TaZfULfMMlbNChKOEXGfCZjVY64qjD/x?=
 =?us-ascii?Q?fSekUYjZ88Y8kokZOGo9jkr59wwevmFQ9V4GwbbMn/Un4nSPvV949d4C3Hn7?=
 =?us-ascii?Q?MZqoo0V4E1DWkObm4UscxkEFEZD2mvd4rNP2LmOaqR3zalg5VSjnlQBxIaEf?=
 =?us-ascii?Q?HiKJPsKnO4+cdK91gvt7RAt5GazOi4ACxX4HFF+BS4uKdd+iFOqsjV9Umn3K?=
 =?us-ascii?Q?UcL1rUVqyfnX2JRYggx7s3nfmon4agv2Q8rZVu1h0zpeJ8Gl5Q1oCcA6jnHo?=
 =?us-ascii?Q?qnPYpP4/tf418ON5QcOtkQ0oKcn2wuhVH+Q+yITJEg+1e0V2qd4rm+R3u2+Y?=
 =?us-ascii?Q?H08Nx6RVYcCD4cp6JCuSIotbKJ4pqBlM3Kju1nOByGgxVapnYcJpfDnuc25G?=
 =?us-ascii?Q?hTW30XlfpwdoF/iS+S/Ss7U0NDUd6XezabBGedBRmemqzHq3xztcS8oxFYW1?=
 =?us-ascii?Q?o3r8rtec9e5ywxaaziToOZKLpclRI4FRlyljC7fRky+nf45njM/1QSeGw3KV?=
 =?us-ascii?Q?9PTyZLwoDDAaNJZy4X0L1nCTPTuCagv1oIOQIdtJa3ftj6iYzxNH+w8DiOzu?=
 =?us-ascii?Q?lHkiF08mXJAdBS1xuHanWwp6mYT/Ck8PaelnCG98777I3vLaDoYqh5Cv0fqK?=
 =?us-ascii?Q?UtPkwxnb1qferLwweLDiwFJUjh4rGmrS3HcfRHwZ4pvWo/35yUJ2yab821Wg?=
 =?us-ascii?Q?JuI2zdxBCgkchp/grJe8zKcWwzJKuP++xjkyCSAYevkDotmx+qPnfYNzXlkP?=
 =?us-ascii?Q?3LkLQR5lNG+5HkCsM/HzfbA+1olTId+2xfsBg5G23Cp4Q2S8Glt22vjbEbDk?=
 =?us-ascii?Q?mVFxpqmqflS4Hh15rgHGkyHC6sSunM568fi6cmQ6+MI6GuJn11mdus0axCnw?=
 =?us-ascii?Q?UOmZcUCvFdQSOynUeIGU29gCbaPIq5m11vMoEl1TYbacNSzt92UoPoZkM6Mu?=
 =?us-ascii?Q?AdwApX2LS0wRB0aqg0zru3VRmbM7rGm09sbEhtuIp/n8KP8JtRGOZk1VUvhd?=
 =?us-ascii?Q?hTzaAwNoKQ=3D=3D?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cf43baf-eaa0-419e-b0ce-08de4e0d5598
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 16:53:51.1881
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j6Ke7l12mE7nEUrGepAsRCmo+VyDmM18euNcCIt31nVBhfcvdwmH3RiU8Om6BRh6zCJr0lEHw+oat33al3xjlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LNXP265MB2441

On Fri,  5 Dec 2025 07:34:05 +0900
FUJITA Tomonori <fujita.tomonori@gmail.com> wrote:

> Make warn_on() support DEBUG_BUGVERBOSE_DETAILED option, which was
> introduced by the commit aec58b48517c ("bugs/core: Extend
> __WARN_FLAGS() with the 'cond_str' parameter").
> 
> When the option is enabled, WARN splats now show the evaluated
> warn_on() condition alongside the file path, e.g.:
> 
> ------------[ cut here ]------------
> WARNING: [val == 1] /linux/samples/rust/rust_minimal.rs:27 at _RNvXCsk7t4azzUqHP_12rust_minimalNtB2_11RustMinimalNtCs8pcx3n4
> Modules linked in: rust_minimal(+)
> 
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> ---
>  rust/kernel/bug.rs | 27 ++++++++++++++++-----------
>  1 file changed, 16 insertions(+), 11 deletions(-)
> 
> diff --git a/rust/kernel/bug.rs b/rust/kernel/bug.rs
> index 36aef43e5ebe..a60db1ef4b48 100644
> --- a/rust/kernel/bug.rs
> +++ b/rust/kernel/bug.rs
> @@ -11,15 +11,14 @@
>  #[cfg(all(CONFIG_BUG, not(CONFIG_UML), not(CONFIG_LOONGARCH), not(CONFIG_ARM)))]
>  #[cfg(CONFIG_DEBUG_BUGVERBOSE)]
>  macro_rules! warn_flags {
> -    ($flags:expr) => {
> +    ($file:expr, $flags:expr) => {
>          const FLAGS: u32 = $crate::bindings::BUGFLAG_WARNING | $flags;
> -        const _FILE: &[u8] = file!().as_bytes();

I think it'll be good to still keep

	const _FILE: &[u8] = $file.as_bytes();


and have the caller just pass in `file!()` or `concat!(...)`. At least the
concat macro doesn't have to expanded multiple times in below.

Best,
Gary

>          // Plus one for null-terminator.
> -        static FILE: [u8; _FILE.len() + 1] = {
> -            let mut bytes = [0; _FILE.len() + 1];
> +        static FILE: [u8; $file.len() + 1] = {
> +            let mut bytes = [0; $file.len() + 1];
>              let mut i = 0;
> -            while i < _FILE.len() {
> -                bytes[i] = _FILE[i];
> +            while i < $file.len() {
> +                bytes[i] = $file[i];
>                  i += 1;
>              }
>              bytes
> @@ -50,7 +49,7 @@ macro_rules! warn_flags {
>  #[cfg(all(CONFIG_BUG, not(CONFIG_UML), not(CONFIG_LOONGARCH), not(CONFIG_ARM)))]
>  #[cfg(not(CONFIG_DEBUG_BUGVERBOSE))]
>  macro_rules! warn_flags {
> -    ($flags:expr) => {
> +    ($file:expr, $flags:expr) => {
>          const FLAGS: u32 = $crate::bindings::BUGFLAG_WARNING | $flags;
>  
>          // SAFETY:
> @@ -75,7 +74,7 @@ macro_rules! warn_flags {
>  #[doc(hidden)]
>  #[cfg(all(CONFIG_BUG, CONFIG_UML))]
>  macro_rules! warn_flags {
> -    ($flags:expr) => {
> +    ($file:expr, $flags:expr) => {
>          // SAFETY: It is always safe to call `warn_slowpath_fmt()`
>          // with a valid null-terminated string.
>          unsafe {
> @@ -93,7 +92,7 @@ macro_rules! warn_flags {
>  #[doc(hidden)]
>  #[cfg(all(CONFIG_BUG, any(CONFIG_LOONGARCH, CONFIG_ARM)))]
>  macro_rules! warn_flags {
> -    ($flags:expr) => {
> +    ($file:expr, $flags:expr) => {
>          // SAFETY: It is always safe to call `WARN_ON()`.
>          unsafe { $crate::bindings::WARN_ON(true) }
>      };
> @@ -103,7 +102,7 @@ macro_rules! warn_flags {
>  #[doc(hidden)]
>  #[cfg(not(CONFIG_BUG))]
>  macro_rules! warn_flags {
> -    ($flags:expr) => {};
> +    ($file:expr, $flags:expr) => {};
>  }
>  
>  #[doc(hidden)]
> @@ -116,10 +115,16 @@ pub const fn bugflag_taint(value: u32) -> u32 {
>  macro_rules! warn_on {
>      ($cond:expr) => {{
>          let cond = $cond;
> +
> +        #[cfg(CONFIG_DEBUG_BUGVERBOSE_DETAILED)]
> +        const _COND_STR: &[u8] = concat!("[", stringify!($cond), "] ", file!()).as_bytes();
> +        #[cfg(not(CONFIG_DEBUG_BUGVERBOSE_DETAILED))]
> +        const _COND_STR: &[u8] = file!().as_bytes();
> +
>          if cond {
>              const WARN_ON_FLAGS: u32 = $crate::bug::bugflag_taint($crate::bindings::TAINT_WARN);
>  
> -            $crate::warn_flags!(WARN_ON_FLAGS);
> +            $crate::warn_flags!(_COND_STR, WARN_ON_FLAGS);
>          }
>          cond
>      }};
> 
> base-commit: 500920fa76819b4909a32081e153bce80ce74824

