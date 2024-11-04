Received: from xmbghk7.mail.qq.com (xmbghk7.mail.qq.com [43.163.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C6869959
	for <rust-for-linux@vger.kernel.org>; Mon,  4 Nov 2024 14:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.163.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730729507; cv=none; b=umuUIusoNxPSz5pU2aLJi/9SxQDJjXlschEbOpLSPq7HEghE8twFfexx77e07n2P0Hx07vFugil8Z+MN4ihXWDnXoyb1JXRVA/FQOU0NuqTt6YlKxCW3hgzcaV24ZIz5hq5ICfvoyrjsR5RslqT+mT0JXn0s7dftJ4Q2iszRhY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730729507; c=relaxed/simple;
	bh=nxzJgiGfVauYAUqwYnFayDbyI4TqqYn+DsTX9UQKHEQ=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CnVosOQeTpM5uLWBtVX5lpGzS4wvYjVXK2CLSa1voLAWFhQLDQISyXDkeGV+gHJ3HaOi2JZ+mNfZHmuoy4h8tUV7yNe+x0ZlOlmzhmd1Tg05m32RbYOSLxIXwz0NSl9vzktY/eFJPIaJeNSGgA7NEWASzXTKP8+34/0sggpg56g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=mljAvzMy; arc=none smtp.client-ip=43.163.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="mljAvzMy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1730729446; bh=i7Fu6Vvk3tupsKwDr7kNH+B53edUvDOeePcstP32O3w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mljAvzMyRx6fF+3ks70VhzVNaHId4+hRkhpGz5S+b47tV6wobDpZ3cimToX6+vxcs
	 +rVRL7GzKx0iMNkeqhOD3t13etdj5HyyEwDJJtsRI6a6cnTe6kfOyUVIZbgNcUGsIe
	 1QdzsMv89cUlO2n488yi1A/SbkMlfRCt/wWQVCEo=
Received: from jckeep-Lenovo-XiaoXinAir-14IIL-2020 ([124.240.53.233])
	by newxmesmtplogicsvrszb21-0.qq.com (NewEsmtp) with SMTP
	id 2AB8FA84; Mon, 04 Nov 2024 22:10:43 +0800
X-QQ-mid: xmsmtpt1730729443t8xnud424
Message-ID: <tencent_E3E9DAED48D683A4D097ED1A1074DEE65A08@qq.com>
X-QQ-XMAILINFO: MzYTHVlhOHw4uq6gJO2QJ6LNWd3aPN0qtOjhjwlFt59P9lM2LpdUTxrDDFAD34
	 D8FYvrJM9krdlL2rTQaXzpUQMzDhUGyAQd3sfJhmj6prCsI1kFrF0Qdpmmmc4iWjTC5qCQlN4je6
	 WLeLKrE+YdZAl7n8BrWmHRR4N4OPDEM5sxHgKt/ct93/ZI/vAL3El0Rv2NWkUhX8pcEvgpg7l3Be
	 4Php3ibiYJUwMK9sx8NS3S9kbIZoUmunx/8xKWbIFB5y4nRPY+6Y6VsdTa1bPstY53ZoFYDwwsTw
	 VKPB55g4e3Mm73Gt50EvV2yG1NSc0BAfLkbna+szsapuTuU2GCB0SMuDbr62aFqeQo+Xo8Ijs/fx
	 Ll7L9pgU40zS3SkpjcrTCSQcyyS5HdpL0YiEk5TOkuot4nVgTQLM5X4NxP62r87ca+OgMrcUkcV1
	 h50VR7EenNrAcNlhz6IcT+mGOjNS8nWJYBHk2UfPGn6AI5jD99WPJUhZhQ8UWyDBg71ee6BJf4+x
	 h9yWqeftdj/vxXnxBTE8EIwKZt9UKVVBiSUQLwutunjpVTiv1vQmZv5WtqLAnjL9MKXJnZqg2qC7
	 zFoiGWUPIIfCfcnfz/p9KzZtZZkFiHHHX8NuAlHIgeWD0699II40JwBSlatLqTgSvU8lEHkPMN2q
	 zbM8mdq2inCSO6cIT4U1KKjqeE5eXg1dUBodXXSqAkpLIYCAFadIYgLHJcAoAGLQwi5OTVhsASHW
	 tIgoViriS4IB+ELe+eAEa/x/ROY9oT5dzv1lqgCIr02P3LzwJbu8VBztvCCgsKWtEajYtvEx+2/0
	 aR+T+e0UDcvfIrqCBtircA1nxLFtuMueWUvvc50dZVbgyVGhC8dAhys3UPATnPfIob/6kMUTNFc0
	 Ile0m99hfJZrDdXGJfXOfh/LecuvzJiQWtqYMKeqW0I1Azrz9P9AYVEnALQpUdgds9fbr9IoVwYg
	 GrEewUNbZxgR0B3nNz7JxgN6BPcprL2tp4gO8L0EawdLtKTM+QKFcS6DnDWh6h
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
Date: Mon, 4 Nov 2024 22:10:43 +0800
From: Guangbo Cui <2407018371@qq.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3] rust: Implement Display for Box
X-OQ-MSGID: <ZyjV4xsW4+2xi+Ci@jckeep-Lenovo-XiaoXinAir-14IIL-2020>
References: <tencent_CC0134B8E94CCD93D347DAB9ACAB48652F09@qq.com>
 <ZyfhMKAjFgEm6rTO@pollux.localdomain>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZyfhMKAjFgEm6rTO@pollux.localdomain>

On Sun, Nov 03, 2024 at 09:46:40PM +0100, Danilo Krummrich wrote:
> On Tue, Oct 29, 2024 at 10:28:38PM +0800, Guangbo Cui wrote:
> > Currently `impl Display` is missing for `Box<T, A>`, as a result,
> > things like using `Box<..>` directly as an operand in `pr_info!()`
> > are impossible, which is less ergonomic compared to `Box` in Rust
> > std.
> > 
> > Therefore add `impl Display` for `Box`.
> > 
> > Suggested-by: Boqun Feng <boqun.feng@gmail.com>
> > Link: https://github.com/Rust-for-Linux/linux/issues/1126
> > Signed-off-by: Guangbo Cui <2407018371@qq.com>
> > ---
> > Changes in v3:
> > - Update `fmt` implementation to clarify that it does not call itself infinitely.
> > - Link to v2: https://lore.kernel.org/rust-for-linux/tencent_F71CE9D125A8C6191D8CF95B3A4F3BB2F506@qq.com
> > Changes in v2:
> > - Add missing tag: Suggested-by.
> > - Update the patch title and the changelogs.
> > - Link to v1: https://lore.kernel.org/rust-for-linux/tencent_CA5A5D6268F0D1419BAFA6AFB4EB5A37920A@qq.com
> > 
> >  rust/kernel/alloc/kbox.rs | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> > 
> > diff --git a/rust/kernel/alloc/kbox.rs b/rust/kernel/alloc/kbox.rs
> > index d69c32496..a496a866d 100644
> > --- a/rust/kernel/alloc/kbox.rs
> > +++ b/rust/kernel/alloc/kbox.rs
> > @@ -427,6 +427,16 @@ fn deref_mut(&mut self) -> &mut T {
> >      }
> >  }
> >  
> > +impl<T, A> fmt::Display for Box<T, A>
> > +where
> > +    T: ?Sized + fmt::Display,
> > +    A: Allocator,
> > +{
> > +    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
> > +        <T as fmt::Display>::fmt(&**self, f)
> 
> Since you went with this variant,
> 
> > +    }
> > +}
> > +
> >  impl<T, A> fmt::Debug for Box<T, A>
> 
> please also change it for `Debug` in a separate patch, as requested in [1].

Thanks dakr, I forgot it last week. Fix it in v4.

> 
> With that,
> 
> Acked-by: Danilo Krummrich <dakr@kernel.org>
> 
> [1] https://lore.kernel.org/all/a335869c-6bc4-49c1-b6a8-1c4ca4e98b20@kernel.org/
> 
> >  where
> >      T: ?Sized + fmt::Debug,
> > -- 
> > 2.34.1
> > 

