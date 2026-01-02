Received: from forward502a.mail.yandex.net (forward502a.mail.yandex.net [178.154.239.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898C7221578;
	Fri,  2 Jan 2026 20:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767386040; cv=none; b=a3Lnc3AFJJkn5kKMXl4r8Wk86cElEj0dLIw8btmUjfD148R9fWELUa4QDB1+OCV7IxELLsAGBPmdQ/OcdGyMBoo+kXEYUIqUYyu8UJgts7ViIG4vGINY1IdFdzX4BhAOmSXCHKwc9CuWeDbthCc/LmsE7abokIu7zjM733bOEEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767386040; c=relaxed/simple;
	bh=SR3W86exwj6qUL05HpZ2kC7v5a9si6bZ3/RWjYayAYE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UiyekoewarXL1AzNLax/U3U5SQCxMNVk+sIf+ld84gx+H/xhswdMxIy3I+KTfJsbV2KIpCPsm+hOTvbK6h2M1RmFpWCLpNQg0NtJbVrP63YMHLCE+bVUpxdcOzFlwNft3hC4+KBVfnvbmx7E74QUvxtppvBeiN/iN0rvV6P1LwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=TUgukP3j; arc=none smtp.client-ip=178.154.239.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="TUgukP3j"
Received: from mail-nwsmtp-smtp-production-main-74.vla.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-74.vla.yp-c.yandex.net [IPv6:2a02:6b8:c1f:5d94:0:640:92d3:0])
	by forward502a.mail.yandex.net (Yandex) with ESMTPS id 6867780F6D;
	Fri, 02 Jan 2026 23:28:01 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-74.vla.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id tRs0RWGGqW20-SDd1W7eM;
	Fri, 02 Jan 2026 23:28:00 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=mail; t=1767385680;
	bh=k30ReYCRXOETSZ7O8nLjn2JaBppnDs1AxyjN4RHWxFA=;
	h=Cc:Message-ID:Subject:Date:References:To:From:In-Reply-To;
	b=TUgukP3jWGfYOofFfvfWQOSCsNiPA9g0gIDCp4wEbpgou1NYORmxRCgiHuQcJQLpj
	 /UBNaZtvkXXde93LsBjKWcGq27Xbkpoev4pG8FuDyj/vZCBD5pF7qSqvqzE9GboQxe
	 KoYpcIX+jLhakW7RsGvrq5UV4XF3lBF7lDTc6WzU=
Authentication-Results: mail-nwsmtp-smtp-production-main-74.vla.yp-c.yandex.net; dkim=pass header.i=@onurozkan.dev
Date: Fri, 2 Jan 2026 23:27:53 +0300
From: Onur =?UTF-8?B?w5Z6a2Fu?= <work@onurozkan.dev>
To: rust-for-linux@vger.kernel.org
Cc: lossin@kernel.org, lyude@redhat.com, ojeda@kernel.org,
 alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
 dakr@kernel.org, peterz@infradead.org, mingo@redhat.com, will@kernel.org,
 longman@redhat.com, felipe_life@live.com, daniel@sedlak.dev,
 daniel.almeida@collabora.com, thomas.hellstrom@linux.intel.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 3/7] rust: error: add EDEADLK
Message-ID: <20260102232753.5b5a8fa1@nimda>
In-Reply-To: <20260102175302.194435-4-work@onurozkan.dev>
References: <20260102175302.194435-1-work@onurozkan.dev>
	<20260102175302.194435-4-work@onurozkan.dev>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri,  2 Jan 2026 20:52:58 +0300
Onur =C3=96zkan <work@onurozkan.dev> wrote:

> This is needed for the ww_mutex implementation so
> we can handle EDEADLK on lock attempts.
>=20
> Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>

I forgot to include

	Reviewed-by: Lyude Paul <lyude@redhat.com>
	Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>

tags from the v7 series for this file. :(

> ---
>  rust/kernel/error.rs | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
> index 258b12afdcba..c2b95db23abc 100644
> --- a/rust/kernel/error.rs
> +++ b/rust/kernel/error.rs
> @@ -66,6 +66,7 @@ macro_rules! declare_err {
>      declare_err!(EPIPE, "Broken pipe.");
>      declare_err!(EDOM, "Math argument out of domain of func.");
>      declare_err!(ERANGE, "Math result not representable.");
> +    declare_err!(EDEADLK, "Resource deadlock avoided.");
>      declare_err!(EOVERFLOW, "Value too large for defined data
> type."); declare_err!(ETIMEDOUT, "Connection timed out.");
>      declare_err!(ERESTARTSYS, "Restart the system call.");
