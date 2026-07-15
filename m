Received: from mail-106112.protonmail.ch (mail-106112.protonmail.ch [79.135.106.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A994BC026;
	Wed, 15 Jul 2026 20:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784145837; cv=none; b=u+tXTynBa9RHaImpwZu/PY+lFVUDBYgHJy9FL1cClSVQfWBy1wyING9RjvAippqUezP7azaFCTMiuYCMJHVXpJ5bKEWvVwXEIRPkY0yoIEOE0Q7QKgmOutkcT9VFaUIv0sBL7kNRWOmmyrvqIeJ0z+1G6w3sHNEHtxWpbTeOxgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784145837; c=relaxed/simple;
	bh=mxZtatRWlTVQYOH9aCKnwVTK4nBk5WlQy0U514gTPIg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mTFnEc3ycCJ0pLcvKYRqQaw7L5XWRNqe0GdhuFpSeqJSm55niaudJD6Ugpql4S1Gmvznsidmz4VMOhPbc4oS46HeOMg2xVOeRUCuMUUBU+un4KZemUMfqXP2tsPqf4LRhP5pSPh5l1oEvh3TVOugTDSTKfoS7jb4GVIwsveT/IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=KCwhOvWG; arc=none smtp.client-ip=79.135.106.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="KCwhOvWG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1784145832; x=1784405032;
	bh=g/CYReVUA7tKjrfK+oP2QeLP0DLtyYHy63HTvErRdJA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=KCwhOvWGo6dhXDD2UPNVTg2rQaoSm39Eto8DhZs+HS50cQps1VxPvT0m7qdYQlfob
	 92RH+UlI8o8N9Ujz9otNa1AaOgQA9K7I2Nw6wxv2ktvEkfb2m+ipy5gToJ08f9twK/
	 Xn1EdEjO7PsNUAukQhnsml33AFS9PUgAehMsUEL+AkBgyUoad5O9zpDdcFXyzCWipB
	 h96svYyLG9wUam1r0Tyc6QgxU21pA2rkvaDsPdBq9fbN+X7t5+TnhmBbM5tLph3Et3
	 bXgusswrwnznkkx4/pj9UyBX1I4w6IP61LZts6f886wZCK6+s+1FkJWBeKrvcdsw6+
	 VqWqw0SjWEKdQ==
X-Pm-Submission-Id: 4h0nDf3yrbz2ScdL
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: Philipp Stanner <phasta@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Asahi Lina <lina+kernel@asahilina.net>,
	Burak Emir <bqe@google.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Krishna Ketan Rai <prafulrai522@gmail.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Mirko Adzic <adzicmirko97@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Shankari Anand <shankari.ak0208@gmail.com>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
Subject: Re: [PATCH v5 2/5] rust: error: Add ECANCELED error code
Date: Wed, 15 Jul 2026 23:03:37 +0300
Message-ID: <20260715200340.48270-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260703073141.3962604-4-phasta@kernel.org>
References: <20260703073141.3962604-2-phasta@kernel.org> <20260703073141.3962604-4-phasta@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 03 Jul 2026 09:31:38 +0200=0D
Philipp Stanner <phasta@kernel.org> wrote:=0D
=0D
> The Rust dma_fence abstractions need the ECANCELED error code.=0D
> =0D
> Add ECANCELED error code.=0D
> =0D
> Signed-off-by: Philipp Stanner <phasta@kernel.org>=0D
> ---=0D
>  rust/kernel/error.rs | 1 +=0D
>  1 file changed, 1 insertion(+)=0D
> =0D
> diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs=0D
> index a56ba6309594..cb666f0d42ee 100644=0D
> --- a/rust/kernel/error.rs=0D
> +++ b/rust/kernel/error.rs=0D
> @@ -67,6 +67,7 @@ macro_rules! declare_err {=0D
>      declare_err!(EOVERFLOW, "Value too large for defined data type.");=0D
>      declare_err!(EMSGSIZE, "Message too long.");=0D
>      declare_err!(ETIMEDOUT, "Connection timed out.");=0D
> +    declare_err!(ECANCELED, "Request has been canceled.");=0D
>      declare_err!(ERESTARTSYS, "Restart the system call.");=0D
>      declare_err!(ERESTARTNOINTR, "System call was interrupted by a signa=
l and will be restarted.");=0D
>      declare_err!(ERESTARTNOHAND, "Restart if no handler.");=0D
> -- =0D
> 2.54.0=0D
> =0D
=0D
Reviewed-by: Onur =C3=96zkan <work@onurozkan.dev>=0D
