Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792525153;
	b=V2gAlp8xaB7R2EtdTeeGdLyMfKYCZadNMTpTRM3tkbHqJaITnzTB2Zhn0VZoBkGDSs3G
	 FfiFJkL0a2I1AOxjZSpVcBSm15FJOwHW2cnoIsRZbxuNGsBFgWLKfzdF1yyLZFb1WtESH
	 /9m5yUd2nS8U1D/O+zeQfZ7pxHq77a1jP+lRTUYJBtzVI3Q3QAB/79ur0BndO9kzJyMLf
	 1LYfVMcQ6dR9egnnRzuD0H/Ro/xq1Fu4SWk63iiRz7M/3DDrPorsQEsoK4XweldunZWMS
	 nPKj0G3ddSfjWHQpbOtCKNAuXi6m6RRWDFCqxvULAfxdioJUE0RwxPyqYokpdd8GK7A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792525153;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:Date:From:To:CC:Subject:Message-ID:In-Reply-To:
	 References:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-NV-OnPremToCloud:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=H+tX97xQLtB/D589Ys72w/vGD0cVxkBX3JAoVzc5imA=;
	b=FMRmmpHTmCCJWDLmLpuznecvr65fuqHMWQU2BJzdmYOK2okPkcVc6cPj2NX5sAwG2gD4
	 AUbpQ1weNTpuf1NVQmpn5Z/WXS9JMAZk8SvyYZXbvP28To6hgAyVPBbuBkExzYACjPBHv
	 tMUVpFpKcGKt+Y1/RVefI5M1xNOSxCHHMa1/pdWfk6pT9f50DlTUiKIrxj28pyNwHGloW
	 qYrP7SWmYYWcnYFnxheEC+VtMBr5eXEHKJOwLzycRbod7ywgRsiao5yC5Dt7L6R3tfaGu
	 VJmVb9fq94/FOzvHdDWOH0/fd/a6O5a+BsT3JdT4rMX7aGBXuhOv/HtigipsA/VZgxg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=TIVQiW1+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.30
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011030.outbound.protection.outlook.com [52.101.52.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355DC606A31A;
	Tue, 20 Oct 2026 19:39:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 355DC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=TIVQiW1+
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X8spVJ4AOTl8fqGQT3tUN4tjEpDIafFouBV6wneTb5EP/4iMcp1lHbJUscWEMK/usN5UwYK6uQYbfhF2TL6/RpD91138e4RwCmx8DdM0tJ6h1WVovGPQXtV3ps1bnNWPnpIslo8QYi10xDqx0fE53lc8PmaNdpzHvawEYq3mS56ig2LqtYZizW1tmPXZyQv6e1nDTxV3aWnMsvbm0/08LgNp2fDIXtPdNVV3jLH2VjoaRBg0konrzK8QIX2Vz7iNTZgzONrg0TgacRU1Wwibwv7U8bpjIXtOBIfxipLe+xEHsINNdncViPPK7vK80IFaPePtRmqnkyYV4O2TVZzZbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H+tX97xQLtB/D589Ys72w/vGD0cVxkBX3JAoVzc5imA=;
 b=K3Ps9HG797UTJKcLTM5jOUEXNPcRiaRY/ugOk6nPsNtjKnTjgtZaUBeqt+4iYTnQ2L1FZhB+F7NoDVVauomG0xGPEQ1kn/1gFu7gG1zDdIZ9yqVv/LOMSF9tDHIQFnVoKGAAQlEuFnOycqRehtolZG5JgBv13oRRK12HAWWzg8gtftYJXar4mDJr2YDKupVQJw69/YGL9G5r8cZvEnuCbr9oVsrWXj11DSrr22EQFzjPi/vsPVt3vCE8j9ZPdkjRuZyP1pNVB8ICj3hinQWWo2SUY0W4Y690OfAb2CnMx0m5TzNuROF5JOG3pMVYiFGGdgTJiEQqif1f9CiHcOsxtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=google.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H+tX97xQLtB/D589Ys72w/vGD0cVxkBX3JAoVzc5imA=;
 b=TIVQiW1+nck5gNJm4NEZBdCz02hsBKTRGpABiLWzjgJ2pkZLDTYDN0yRKTZSgOY6VMywJwBmygNtMGb6VeGFoJx0Ed833Cjscbg31j7C8jh+7JaFHX1K2CymPb6Zu7wF0Ijk2CMTXYyGR7Q3qHljsRaBWIeFvBfOTFNj0UdPGYW9e/QY3WWzYx8g99qTiwb8HZhzVvX1vqoHPXRra8YD7ld+PdX0nv40RYJoBkaSuPLAy+H5r5SSQqCHG0Wle37UFqMLMSe6W8Jwsfc5gockABYmrH6neB7lYaggzV1aFR5fKaAFqzQviRLhe7BjIStCeOd82vmZ8n1Jb9/Uv6gpXA==
Received: from BY3PR05CA0047.namprd05.prod.outlook.com (2603:10b6:a03:39b::22)
 by DM4PR12MB6566.namprd12.prod.outlook.com (2603:10b6:8:8d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.17; Tue, 20 Oct
 2026 19:39:05 +0000
Received: from SJ1PEPF00002313.namprd03.prod.outlook.com
 (2603:10b6:a03:39b:cafe::7c) by BY3PR05CA0047.outlook.office365.com
 (2603:10b6:a03:39b::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.14 via Frontend Transport; Tue,
 20 Oct 2026 19:39:05 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.118.232) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 SJ1PEPF00002313.mail.protection.outlook.com (10.167.242.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Tue, 20 Oct 2026 19:39:05 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 20 Oct
 2026 12:38:51 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 20 Oct 2026 12:38:51 -0700
Received: from inno-dell (10.127.8.11) by mail.nvidia.com (10.126.190.182)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49 via Frontend
 Transport; Tue, 20 Oct 2026 12:38:45 -0700
Date: Tue, 20 Oct 2026 22:38:43 +0300
From: Zhi Wang <zhiw@nvidia.com>
To: Alice Ryhl <aliceryhl@google.com>
CC: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<andrewjballance@gmail.com>, <daniel.almeida@collabora.com>,
	<dakr@kernel.org>, <ojeda@kernel.org>, <boqun@kernel.org>,
	<gary@garyguo.net>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
	<a.hindborg@kernel.org>, <tmgross@umich.edu>, <cjia@nvidia.com>,
	<smitra@nvidia.com>, <ankita@nvidia.com>, <aniketa@nvidia.com>,
	<kwankhede@nvidia.com>, <targupta@nvidia.com>, <kjaju@nvidia.com>,
	<alkumar@nvidia.com>, <acourbot@nvidia.com>, <jhubbard@nvidia.com>,
	<zhiwang@kernel.org>
Subject: Re: [PATCH v3 4/5] rust: print: add dynamic debug support to
 pr_debug!
Message-ID: <20261020223843.2b3bb38e@inno-dell>
In-Reply-To: <20261016085045.3517539-1-aliceryhl@google.com>
References: <20261001145940.1077801-1-zhiw@nvidia.com>
	<20261001145940.1077801-5-zhiw@nvidia.com>
	<20261016085045.3517539-1-aliceryhl@google.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.52; x86_64-pc-linux-gnu)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002313:EE_|DM4PR12MB6566:EE_
X-MS-Office365-Filtering-Correlation-Id: dc5f3682-f062-4353-6f9e-08df2ee1cd12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|36860700016|1800799024|7416014|376014|6133799003|10067099003|22082099003|18002099003|13003099007|4143699003|261009223027099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	pb+IPACY/iqK1RQt9oVa+bpxz+4FMtXAbN4VyfIk+POJ62srK+zIvQit/9ctjYXXzCNUE0hxeDpHQeLsvcxXmD9lHV0zGyos0l61pUOeBLpDcHPrmTyRCgV9fZWj9Iioae5crU1Yvbi5JpFXjUSMsYW08oEdTGJuiEqTD1boy1dXImn9U5c/q+kjtYOVUdVWid9bcHrxTZK8MYOya5LWCKjOIrxbN2/zv+F8kouJgz+ezZQ4w8box/Hj2eTQ2evMoNK0FRmB+VE9Iup1Qf9xbwhEpcg8fGlrl79T/rmofoZywyfUfLvwHNDd69/gzzm6ta5D2zkJCsprTX8wLI/YybSiLu3uK/Nx5uEcoC/8Aoa3Aus6CmAWEqn3YoTfccJWj52v8AgjRVSJuubsdopkgxkQ/SDZE6Jl82ymGCl4UReFjjXkNoNfpfQviTvC3h+AWpbZdrW/FuzvXWK8tjPiCx00gIls3TpBJTKftkdKa5OsN3WtzYPIVfegS4oKnf9m+r5VHgMThvE7oUzNl4ZvBCufjoDfRI5FJ2GHm2i7+9+iv7O84Rc6k/TwTTd05yDpB7hrIzwjLr6kGmQjyEO2PjZ5x1YWu94deEJ/LWLjO3RY3pIAiLfh46XEOim9Nrh4PDZGSe+TyD3rgZ3o51y4ywXifKakyCU+571wXh/tWq0WsujwHyfDvoWnyp/kYHRLoJgwlxOk+wc5Hs/eoTbrEA==
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(36860700016)(1800799024)(7416014)(376014)(6133799003)(10067099003)(22082099003)(18002099003)(13003099007)(4143699003)(261009223027099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PUF0+Ykn7Z+5rzgPXnbKIOlWPiPjZQ5OdM9/raV6cxbgnwus50YYNU5Hg589BRsLjSQ7OUSG4ruqU8q0XcganKgW0kgbwtk81KPCYVQVO8cPW8oDcZcUOXgLLcnaNCPpFWTI9IGdDIgKUOAGpjeXx3CHnwEirg0RjxeZ0viX7xE5Wqtt0V/wRxIaBAXb2XcKWP2i/kA5mbOLl6FiYkz8iEnW7oUTVVmgs3IjH7xAgWVN404sw8bXs7a+ZGOCeQzfkjUId4wu1R+urIIXGjO33eC1Te0+Jb2I75/uzN6nnk+uBRnI22hGoHCFWNobcWFrqASfyZ0aupmat44TH1QIWaQdWojWqfTk5wno+6MbVxxEQrENR+kmhW4NpJKUxv9DsVVRCyTKBzpIGjS91Xm0O7YYTID8Esg6FDegy8CG94RPoShxwHtLwHF2Wc8AAu7E
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 19:39:05.2758
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc5f3682-f062-4353-6f9e-08df2ee1cd12
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002313.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6566

On Fri, 16 Oct 2026 08:50:44 +0000
Alice Ryhl <aliceryhl@google.com> wrote:

Hey Alice,

Thanks for the detailed review. My comments are below.

> On Thu, Oct 01, 2026 at 05:59:39PM +0300, Zhi Wang wrote:
> > +/// A dynamic debug callsite descriptor.
> > +///
> > +/// The [`crate::dynamic_debug!`] macro places descriptors at
> > stable addresses in `__dyndbg`. +#[repr(transparent)]
> > +pub struct Descriptor {
> > +    /// The C descriptor, exposed for static-branch field
> > addressing.
> > +    pub inner: bindings::_ddebug,
> > +}
>=20
> Should this be #[repr(C, align(8))] to match how C adds __aligned(8)
> in DEFINE_DYNAMIC_DEBUG_METADATA_CLS?
>=20

IMHO, I guess this should be already aligned(8)=EF=BC=8C looks like the
repr(transparent) also inherit the alignment from the bindings? [1] I
agree making it explicit looking better for readability.

[1]
https://doc.rust-lang.org/reference/type-layout.html#r-layout.repr.transpar=
ent.layout-abi

> > +impl Descriptor {
> > +    /// Creates an initially disabled descriptor.
> > +    pub const fn new(
> > +        module: &'static CStr,
> > +        file: &'static CStr,
> > +        format: &'static CStr,
> > +        line: u32,
> > +    ) -> Self {

...snip...

> > +        Self { inner: descriptor }
> > +    }
>=20
> Two comments here:
>=20
> 1. Instead of hardcoding `c"<unknown>"` for `descriptor.function`, how
>    about passing `$crate::c_str!(module_path!())` from
> `dynamic_debug!` (an idea from Thomas Wei=C3=9Fschuh's RFC series [1])?
> Even though Rust doesn't have a `function_name!()` macro, recording
> `module_path!()` makes the `+f` prefix flag useful and allows `func`
> queries in `/proc/dynamic_debug/control` to filter by Rust module
> path within a multi-file crate.
>=20
>    [1]
> https://lore.kernel.org/rust-for-linux/20261011-rust-dyndbg-v1-8-832e4039=
b71f@weissschuh.net/
>=20
> 2. The inline bitfield manipulation and `unsafe { core::mem::zeroed()
> }` is pretty ugly. Please use the same strategy as `FamilyFlags` in
>    `rust/kernel/net/netlink.rs` to handle bitfields in `const`
> context:
>=20
>    - Move the bitfield construction into a dedicated helper struct
> with a `const fn into_bitfield(self) ->
> bindings::__BindgenBitfieldUnit<[u8; 4]>` method.
>    - Construct `bindings::_ddebug` directly using struct literal
> syntax with `..pin_init::zeroed()`, avoiding `unsafe {
> core::mem::zeroed() }` and field-by-field mutation.
>    - Add a kunit test (like `test_family_flags_bitfield`) that
> verifies `into_bitfield()` against bindgen's generated `set_lineno`,
>      `set_class_id`, and `set_flags` (or
> `bindings::_ddebug::new_bitfield_1`).
>=20

Thanks so much for the detailed suggestions! I will try to see how to
cope these with the combined patches with Thomas.=20

> > +    /// Prints arguments with the crate's log prefix and the
> > dynamic debug prefixes.

...snip...

> > +macro_rules! dynamic_debug {
> > +    ($descriptor:ident, ($($arg:tt)*), $body:block) =3D> {{
> > +        // Keep item names out of the user's scope, including
> > implicit format captures.
> > +        let (descriptor, enabled) =3D {
> > +            // `used(compiler)` avoids `SHF_GNU_RETAIN`, which the
> > module loader interprets as
> > +            // `SHF_RO_AFTER_INIT`.
> > +            #[used(compiler)]
> > +            #[unsafe(link_section =3D "__dyndbg")]
> > +            static mut DESCRIPTOR:
> > $crate::print::dynamic_debug::Descriptor =3D
> > +                $crate::print::dynamic_debug::Descriptor::new(
> > +                    $crate::c_str!(env!("RUST_MODNAME")),
> > +                    $crate::c_str!(file!()),
> > +                    $crate::dynamic_debug_format!($($arg)*),
> > +                    line!(),
> > +                );
>=20
> Is `#[used(compiler)]` needed here at all?
>=20
> When the `pr_debug!` / `dev_dbg!` statement is reachable, `DESCRIPTOR`
> is already referenced by `static_branch_unlikely!(DESCRIPTOR, ...)`
> and by `&raw mut DESCRIPTOR` passed to `Descriptor::print`. And if the
> callsite is optimized out (for example, inside an unused function or
> dead branch), we *want* the static `DESCRIPTOR` to be deleted as well
> rather than leaving an orphan entry in `__dyndbg`. This would match
> C's `DEFINE_DYNAMIC_DEBUG_METADATA_CLS`, which does not use `__used`.
>=20
> For instance, with `#[used(compiler)]` present, the uncalled `fn
> example` in the `dev_dbg!` doctest still emits a dead `DESCRIPTOR`
> into `vmlinux`'s `__dyndbg` section.
>=20

I see. Thanks for the detailed explanation. I am thinking if we can
remove #[used] here? This is originally from Andrew's patch and causes
kernel write fault when I try to enable the dynamic debug prints. I
also see Thomas' patch is using used(compiler) [2], guess he might
encounter the same problem.

My problem is my rustc/LLVM (rustc 1.94.0/LLVM 21.1.8) generates this
symbol as SHF_GNU_RETAIN in the .ko when with #[used] and Linux kernel
module loader explains this to SHF_RO_AFTER_INIT, then write fault is
triggered when enabling the print...

[2]
https://lore.kernel.org/rust-for-linux/20261011-rust-dyndbg-v1-8-832e4039b7=
1f@weissschuh.net/

> > +/// Stub for host doctests, matching [`crate::print_macro!`].
> > +#[cfg(testlib)]
> > +#[macro_export]
> > +macro_rules! dynamic_debug {
> > +    ($descriptor:ident, ($($arg:tt)*), $body:block) =3D> {
> > +        ()
> > +    };
> > +}
>=20
> If `dynamic_debug!` drops `$body` under `#[cfg(testlib)]`, any
> variables used only inside `pr_debug!` or `dev_dbg!` will trigger
> `unused_variables` warnings under `testlib`, and `$body` won't be
> type-checked. How about:
>=20
>     if false {
>         let $descriptor: *mut
> $crate::print::dynamic_debug::Descriptor =3D ::core::ptr::null_mut();
>         $body
>     }
>=20
> Alice

