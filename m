Received: from mail-244108.protonmail.ch (mail-244108.protonmail.ch [109.224.244.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 830212BEFE8
	for <rust-for-linux@vger.kernel.org>; Wed, 10 Jun 2026 05:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781070322; cv=none; b=AKuvoLP9vFoBvV9q1wLHWbAF/cHyj1jmqthUdjeMMw84/qr5VQH++3uI8+ILnSFfLM0iaCMgrdhhaDxTSM7jwk7yBFaOXqquNnNMMm3TP/1NgB7OngH/96m/Nxa3cH1h47iZrKROOIE4H5Edq+ZehEi8P0EMYpG9xbeCtRjN/wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781070322; c=relaxed/simple;
	bh=tt/RDb22dd0P7kzmAUcZ+vtQPgikjp/8jGyvBCf4bYo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hUJaYg4Siga6r9jb5OuwoXRMcc+zMH2I9/tpDvxThN6NFvESgD4VLEJa/MZvDAyFLZdFIuLlf7z5zlhXS/LFHRpejseogzh/EQaEigPV2lEfrR2gQIKEMNCcAj4crTZOTdmWrjxglEQEX8l6p1QjlhI7bHBetHJI4yxs/CwDVAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=sOOVaYAk; arc=none smtp.client-ip=109.224.244.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="sOOVaYAk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1781070310; x=1781329510;
	bh=Uk0vQkRILjOBR9BGUB0z3EZ+4PZv5LilTXqelWKkVSM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=sOOVaYAk7ZFjL7hYc1xF7zVyv3xW9QOukFqxVjhzRB75xZRp+bv9uVxbEQuQsK7pn
	 nn71tl7b8zlVxIHi9/XEgLYygV8RtyU5uZuQv0FUzMvFX3sa49sx+lUYeH+NK3xga8
	 vhGcjs0G6R6tZnWsae/P2hfMvITYq1P0Pau7DsGLsE6L0Z3TucDF8Atvva9chzJLaj
	 4Ue0jOKKqDY5j5aWyE4kiwpLtlQTdDOU18Co0Ws57gJK7Duu8/7F6Ybr9V6iYnG4Gy
	 W5vaegeHiBjRQCjjQ+jWMHyaDDA3zDe9IKorslby9Y9rEaYxNmfaVhIPE1SLSCB6i/
	 9Zzi/zFo6hcIg==
X-Pm-Submission-Id: 4gZvr10trfz2Scps
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: Georgios Androutsopoulos <georgeandrout13@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Carlos Llamas <cmllamas@google.com>,
	Alice Ryhl <aliceryhl@google.com>,
	=?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>,
	Christian Brauner <brauner@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Paul Moore <paul@paul-moore.com>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust_binder: add ownership assertion to Node::add_death
Date: Wed, 10 Jun 2026 08:45:01 +0300
Message-ID: <20260610054503.27046-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260610035544.3333022-1-georgeandrout13@gmail.com>
References: <20260610035544.3333022-1-georgeandrout13@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 09 Jun 2026 23:55:44 -0400=0D
Georgios Androutsopoulos <georgeandrout13@gmail.com> wrote:=0D
=0D
> The `// SAFETY:` comment in NodeDeath::set_cleared assumes that a=0D
> NodeDeath is never inserted into the death list of any Node other than=0D
> its owner. However, this invariant is not enforced by the safe function=0D
> Node::add_death, which inserts NodeDeath into the death list without=0D
> checking that death.node =3D=3D self, leaving a risk for future code that=
=0D
> may miss this implicit invariant and cause undefined behavior.=0D
> =0D
> Add an assertion to make this precondition explicit and catch potential=0D
> violations early.=0D
> =0D
> Link: https://github.com/Rust-for-Linux/linux/issues/1237=0D
> =0D
> Signed-off-by: Georgios Androutsopoulos <georgeandrout13@gmail.com>=0D
> ---=0D
>  drivers/android/binder/node.rs | 4 ++++=0D
>  1 file changed, 4 insertions(+)=0D
> =0D
> diff --git a/drivers/android/binder/node.rs b/drivers/android/binder/node=
.rs=0D
> index 69f757ff7461..20eaaefbd4cc 100644=0D
> --- a/drivers/android/binder/node.rs=0D
> +++ b/drivers/android/binder/node.rs=0D
> @@ -333,6 +333,10 @@ pub(crate) fn add_death(=0D
>          death: ListArc<DTRWrap<NodeDeath>, 1>,=0D
>          guard: &mut Guard<'_, ProcessInner, SpinLockBackend>,=0D
>      ) {=0D
> +        assert!(=0D
> +            core::ptr::eq(self, &**death.node),=0D
> +            "attempt to add NodeDeath to the wrong death list"=0D
> +        );=0D
=0D
I think having a `debug_assert!` should be fine. That's also your suggestio=
n in=0D
the GH issue link above.=0D
=0D
Thanks,=0D
Onur=0D
=0D
>          self.inner.access_mut(guard).death_list.push_back(death);=0D
>      }=0D
>  =0D
> =0D
> base-commit: 287afdc7671a03081f48f3407bc59862c202bd4b=0D
> -- =0D
> 2.47.3=0D
> =0D
