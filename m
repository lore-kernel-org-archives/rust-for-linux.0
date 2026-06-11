Received: from mail-244108.protonmail.ch (mail-244108.protonmail.ch [109.224.244.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6B4346791
	for <rust-for-linux@vger.kernel.org>; Thu, 11 Jun 2026 06:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781159824; cv=none; b=g6HFJkCGO74GoTn/Zp3JJbOQBtqOciYr6uTIAIk4rwu4VeB/aZCTDGmAENS5/dTDFcbedEr2y58ouh/QkuajPAXw+7eAG3UEzW9KFhKOoznjl8xuW67va9vZbJqJI1vxalfRIO9homhxC5QJCfaQSZ3XTw72eeTZo03I0qk5hr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781159824; c=relaxed/simple;
	bh=f4W1mnT3t+bd7nqB26X40wjbSkk28Ws1Z4i5LHpTXoQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OniAr5vpgam7hNw2TWniFGZdoIE8vi1OZr88p0CT/vEhQD4Id+bec1y38Oh0nysD0O7s1LDPKqaevRmx1SZkMW/dZRp8klRUHbB5yxCmz6TFTDHqojH15uH+PTvydRCn0zDMjNbgCUH4cIa4ymMOw99HE0jQXXhVUhwMeQ5+pdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=MgBVcBdG; arc=none smtp.client-ip=109.224.244.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="MgBVcBdG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1781159813; x=1781419013;
	bh=zrpUMMBgmVySR+SDu/7NWHyTD1iDiS/U48NtwSdHLKI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=MgBVcBdGEWXPA7P2RQ66pxaR1DLn0TgCW6+BSNqP6XT9PmJyaqDlX/+97Gkp070jE
	 7qh+C4rPeAU+tdml9qO5Kzw3mH/msqtynxP4lWqVA5uKF2u9DjJYiBeA+D2kzOG4q8
	 81hNypVARHqLiYjybvzRnQBQMCvUVp5nH28Pwn/+DBujZj9hqLg2EPCtZeD3E0lsBP
	 f0ayBIeIGs6RDqwwQ7klL0Yj6wxLWFJwCUwXafIWHiy1Yk3eQ2YgMzgYG6LtcLkEWS
	 lyweGELFcdfvLzkyXrFw+fUOBL7zcEqPhLt7zpZieO+lMRNBxVyDU7kV3ah8rcYtwV
	 wUIbBmTw1AdIg==
X-Pm-Submission-Id: 4gbXxD6KY7z1DDLd
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	rust-for-linux@vger.kernel.org,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
Subject: Re: [PATCH 4/4] MAINTAINERS: add Onur Özkan as Rust reviewer
Date: Thu, 11 Jun 2026 09:36:43 +0300
Message-ID: <20260611063646.4775-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260611055538.61425-4-ojeda@kernel.org>
References: <20260611055538.61425-1-ojeda@kernel.org> <20260611055538.61425-4-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 11 Jun 2026 07:55:38 +0200=0D
Miguel Ojeda <ojeda@kernel.org> wrote:=0D
=0D
> Onur has been involved with the Rust for Linux project for a year now. He=
=0D
> works on the Tyr driver for Arm Mali GPUs [1] and has been driving the=0D
> `ww_mutex` series and the SRCU abstractions, as well as improving the=0D
> core Rust support in several areas.=0D
> =0D
> In addition, he is already a reviewer of the `RUST [SYNC]` entry and has=
=0D
> been involved with upstream Rust -- for instance, he led the bootstrap=0D
> team for two years.=0D
> =0D
> His expertise with the language and its toolchain will be very useful to=
=0D
> have around in the future. Thus add him to the `RUST` entry as reviewer.=
=0D
> =0D
> Link: https://rust-for-linux.com/tyr-gpu-driver [1]=0D
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>=0D
> ---=0D
=0D
Thank you for your kind words!=0D
=0D
Acked-by: Onur =C3=96zkan <work@onurozkan.dev>=0D
=0D
>  MAINTAINERS | 1 +=0D
>  1 file changed, 1 insertion(+)=0D
> =0D
> diff --git a/MAINTAINERS b/MAINTAINERS=0D
> index bf7a7a52e9a8..f925356a0b49 100644=0D
> --- a/MAINTAINERS=0D
> +++ b/MAINTAINERS=0D
> @@ -23396,6 +23396,7 @@ R:	Danilo Krummrich <dakr@kernel.org>=0D
>  R:	Daniel Almeida <daniel.almeida@collabora.com>=0D
>  R:	Tamir Duberstein <tamird@kernel.org>=0D
>  R:	Alexandre Courbot <acourbot@nvidia.com>=0D
> +R:	Onur =C3=96zkan <work@onurozkan.dev>=0D
>  L:	rust-for-linux@vger.kernel.org=0D
>  S:	Supported=0D
>  W:	https://rust-for-linux.com=0D
> -- =0D
> 2.54.0=0D
> =0D
