Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.157
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793696540;
	b=3npZU4lV8x/SwY8Q8D0WjEDRnEJIg0W63nVABOOOJVDXJ7MiHE3TRUkpgJhnrXIxsKqo
	 /lIL0MTGJ8bdurNaSylMxsNNLjQPq1xyilfGi7DNRiQn20uFEIP8g8DIXg+I+8PPZHmvk
	 hoXk3oje6wCnB62+QBT63pS9gu/NFYsQGtJTp+d9qKLKIDg/eHjXqhdYtLOcuu/BH9R1v
	 MyMeeI052g+5LnSjuJZWghFYe/5xdE77V15iI2G+/u3woerLNxFwy1TuSLSQXbXO1Md9m
	 HQVavhJxfwmdAj2Vh94T1SsHtZ4G9AHeLR6pNGvLfGI5R4VgFE++spUcnPkO+YsdiTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793696540;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type:Content-Transfer-Encoding;
	bh=2LZuOQUYdObxls8EeehpLT/hCQTEx9K6h39je+6lXGU=;
	b=iqNw+vgoa7im25DwOwjaHasMzrIaJV/eILsxkS298PcpgSUKE61VRZuBVy4y8Y4JXtoz
	 CaPCV5kQu2ZWeRU5q5fc98JO/fmKTb3YNRt+zBq6/XXoe+FFHHl8jkbeYninh8Cu6FiJx
	 Id8Ov3QSPZHAOqbrt12uTIb5fW5R+cFNFfnS58aPbUHUgPxNXHGyPvcEYNaWIt85bt2gE
	 qfz6PnQNFrnEJjSwsUFfr2H57Me9Vc2kOOXODY7UAmKBbGY+Xv2iz2ay0gG89+v4z8eqY
	 ZvmjbGHZC168nVb/65joI0Uqdh5kgfvIYzyXZyT3ScnWnjdB21LyihY3STAU4XXb2Fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=flapping.org;
	spf=pass smtp.mailfrom=flapping.org;
	dkim=pass header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm1 header.b=hwVCcPnS;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=EK6bWTm9;
	arc=none smtp.remote-ip=202.12.124.157
Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F35FE606D83D
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Nov 2026 09:02:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F35FE606D83D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm1 header.b=hwVCcPnS;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=EK6bWTm9
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 4EC2F7A0134
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Nov 2026 04:02:19 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Tue, 03 Nov 2026 04:02:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1793696536;
	 x=1793782936; bh=2LZuOQUYdObxls8EeehpLT/hCQTEx9K6h39je+6lXGU=; b=
	hwVCcPnSvyIWZ091Msw8sqNbpv98p0TKHE1pXf9qQsTCSnEvrZCxmIsMLBClyc4G
	kAoDxaWIANUr1ufGNOrCA6JwboWibZXNz4aMFw0OzGekHV40jhDhQWwrhTQooXWZ
	lZdwTpLp9DfSwVdQrJAK06x5i24TdPqKkc5gPJ45uJLvpEvw4ZW7mBsTevRB/0nQ
	FPHJ9VlYsjn41jHpm8KaeNGZvs8GbXZM0w1YdJhZawap26B0UxmZNgEot4BOnVJO
	OLTBAdb8NXQx7KStKfW2UaVfz5zahx1MiPsdvKoJaebFBRxd9zqyTeay1YVFKeJX
	WBFy9B0lZqnkbaRdzj7yzg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1793696536; x=
	1793782936; bh=2LZuOQUYdObxls8EeehpLT/hCQTEx9K6h39je+6lXGU=; b=E
	K6bWTm9i1foFtjee37KPnSTvGWh3NTXEJDl3vUEbVveKA0JYipVqAJJtC4OHQC+V
	fT6TEJfrX5v1iQV4Xp7eYh8IzaXFrKmlCspTeJR4OpAcpCyw0zDak4NUVPPqoAfe
	yxK09O22r3k6DL8KWWaevXDNkkl+XgK1WuELbT+rYhGN7WPzwCLTjmgVR0H/dZgM
	FFBGSlbBdLkUA13+QGSmNhvT8shYGgImxDayqvfFjVvHF51FQCi6HDgV+qyb9j5D
	Qe6RWzVyRKKJ7SiQ4nf0lQhDQqc4ty1JVYXGAhwSB/uqGcm9B3Ihu0eP0ZQyIr3v
	R4Pq2Dxvtbr6P+IeP9E8g==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=flapping.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793696536; d=flapping.org;
	mf=PHRvbW9AZmxhcHBpbmcub3JnPg==;
	rt=PHJ1c3QtZm9yLWxpbnV4QHZnZXIua2VybmVsLm9yZz4=;
	s=fm1:rsa-sha256:CcC6E8IhC/aWe2PNXHqDOz1RTG88CwSvP1auvmk+olihe/k
	N8DGLX4NpWIJo5D7rWDTB0XRtXp0b644PsP2KWc3NWdJfaHfvW5OY6y7xcH+jlrW
	WhzXmg+/ZBh7d4fpGEc0KoEfDFEnRcDKj7DRNmcx5b5Ukn8DiqYa4l2lDJXHE2qi
	QdMNdu/N9vGRzPZUek/7QgrzN3TY+66qiWD/8wc3qAaOOyOcHWZKiWBctAgi2eU0
	RLQuxRwFQa/7du30pG1X6dlJZujVW+uGoLXPLhuh4KS2CKqCq8YoQsLDpNl1Un1O
	B8nSwx153DPz/hojPNQLfe8iDMQihsJXYsAgb4g==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:yZvCQa0KAjOIjwGMl6rddYwf5pp+gnL2LgjEGHJUMec=:CnxP2DM2nggyX8bEVFzvj2plNPRomHh//c1cRvzNKpY=;
X-ME-Sender: <xms:F6Ppap05Ypg3icDbz-VSJooAC9uPKJNUgwiElpzwDXBooobjzLCX1Q>
    <xme:F6PpavXNB4m4sGjAMsOGgKg6qRy680OtrN6CetJgZKLtRhpxrIVUDdrBOqdWzBjMh
    PAAuBiPglotllTujk6_eg4XuTImWp1pqRPINbY4dROOiMpgvbBA>
X-ME-Received: <xmr:F6PpasvDl8nus5QsMWBcDEAvQijOCYkfze2PYPKluAqj02ij0w9BBXlCUK0YFMNvtoeD5OOU2ArSYJrHirs9yUah>
X-ME-Proxy-Cause: dmFkZTFPnfC/keGYTJXFxZvRKUZIISxDJdF35El/p6gWAw1ziSk3Kdcb1+5ZQD8vgQxrdh
    qH6wJmhMKdMUlBC/zRiFF3OijmUo1hJbtUD1PkMfwg+mJzGtlkXvHTnsI6onwJoWS2Z9WY
    G2cCc4LXk1wsCAgd8Z9+73QG8llM8dl7WYzeQBIfryDtLbnwKNigB+yVFrcNUIbm7bP/oP
    VLqROzCOfI/JuaoWcA9YmePCyuUn9k9s/Eu3mdcN7v14Qls+g1hn4gsLtwH18xTKAzqynC
    pd6T9/VwxS++0Z4OXhoIsu/LD/IIK4b9bkYDkzIU3ZEcGb5x7634DR6cLBkAeWD3TdXyfI
    B19lgckQXdT1MOslRfV5ZU5mG1llfkJatzBHd6JJABwNBWlcjZBC7KX+vGumbl+bZG4kFM
    JjYPYzCnP7S5zjtJ/DilxQGHmgVUP9KvVRig2N0SjulMEJQFKT6V4+YmkxJEqQurN6HUY4
    Ep0eUd9qcd7XADD/3W8lEY8wWgISUZIcjwTm8YYE5j4n5WBlOh75xP5d6Qeq1rnJSdoP9M
    EdzMLm9oQYTTCaHQMFB6SnaHYPFxR8+ufqHxj5aCC55ybErYeyKZSDQva6qS6IkIttT/Bj
    lNucSXIeNopXVKBRanw6sAR+4gEuK4WGsqBYUC6LR6+Np9PY4FE4w9n0S6eg
X-ME-Proxy: <xmx:F6PpauWWfDXnoJFF7GHQsnXro8PPR6MXRWW_Y1Fl84OCPTCj5kzjxw>
    <xmx:F6PpagVGBprx3OvIMh317dT_IBpzakuK7xmFs969elhHb1ikQKuoJg>
    <xmx:F6PpagedM_bRKgRyrZp9nRYlX5odVtIvZqTEAsWFGyhegB-gH5Ms2w>
    <xmx:F6Ppav4MlhAaUPobuxQUMZdxbDUR7rcsydZ9H6jk8nTSttuSKONWuQ>
    <xmx:GKPpalbLd5fbX0tETpeG627f2vexjWl65qELF-EUzD8xAKmStD1AYx5a>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 Nov 2026 04:02:10 -0500 (EST)
Date: Tue, 03 Nov 2026 18:02:07 +0900 (JST)
Message-Id: <20261103.180207.1243555897796693771.tomo@flapping.org>
To: richard@nod.at, anton.ivanov@cambridgegreys.com,
 johannes@sipsolutions.net
Cc: ojeda@kernel.org, a.hindborg@kernel.org, acourbot@nvidia.com,
 aliceryhl@google.com, bjorn3_gh@protonmail.com, boqun@kernel.org,
 dakr@kernel.org, daniel.almeida@collabora.com, david@davidgow.net,
 gary@garyguo.net, linux-um@lists.infradead.org, lossin@kernel.org,
 tamird@kernel.org, tmgross@umich.edu, work@onurozkan.dev,
 rust-for-linux@vger.kernel.org, fujita.tomonori@gmail.com
Subject: Re: [PATCH v1] rust: arch/um: Fix loading Rust modules
From: FUJITA Tomonori <tomo@flapping.org>
In-Reply-To: <20261004121230.373216-1-tomo@flapping.org>
References: <20261004121230.373216-1-tomo@flapping.org>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hi, UML maintainers,

On Sun,  4 Oct 2026 21:12:30 +0900
FUJITA Tomonori <tomo@flapping.org> wrote:

> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
> 
> Rust modules fail to load on x86_64 UML:
> 
>   # insmod rnull_mod.ko
>   subarch: rnull_mod: Unknown rela relocation: 9
>   insmod: can't insert 'rnull_mod.ko': invalid module format
> 
> arch/um/Makefile adds -Crelocation-model=pie to KBUILD_RUSTFLAGS. This
> comes after -Crelocation-model=static in the top-level Makefile, so all
> Rust code on UML, both built-in code and modules, is built as PIE. In
> PIE mode, rustc accesses statics in other crates through the GOT and
> emits R_X86_64_GOTPCREL (9) relocations. UML uses the x86 module loader,
> and it does not handle them.
> 
> Remove the flag. Rust code, both built-in code and modules, then uses
> the static relocation model, the same as C code.
> 
> Modules still fail to load with a larger mem=, such as mem=512M,
> because Rust code uses the small code model while C code uses
> -mcmodel=large. This is a separate problem.
> 
> Tested with clang 20 and rustc 1.90: vmlinux builds and boots, and
> rnull_mod.ko loads with mem=32M.
> 
> Reported-by: Zigit Zo <zig@iorw.io>
> Link: https://lore.kernel.org/rust-for-linux/62F5EEA0B866E9E0+20240903130606.292935-1-zig@iorw.io/
> Assisted-by: LLM
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> ---
>  arch/um/Makefile | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/arch/um/Makefile b/arch/um/Makefile
> index 937639edc295..c4a99073f014 100644
> --- a/arch/um/Makefile
> +++ b/arch/um/Makefile
> @@ -62,8 +62,6 @@ KBUILD_CFLAGS += $(CFLAGS) $(CFLAGS-y) -D__arch_um__ \
>  	-Din6addr_any=kernel_in6addr_any -Dstrrchr=kernel_strrchr \
>  	-D__close_range=kernel__close_range
>  
> -KBUILD_RUSTFLAGS += -Crelocation-model=pie
> -
>  KBUILD_AFLAGS += $(ARCH_INCLUDE)
>  
>  USER_CFLAGS = $(patsubst $(KERNEL_DEFINES),,$(patsubst -I%,,$(KBUILD_CFLAGS))) \
> 
> base-commit: 2dee3d3adcadcc57d62ba6608cd02f50b0c10264

Gentle ping. The patch still applies cleanly on top of v7.4-rc1. If
it looks fine, could you take it through the UML tree?
