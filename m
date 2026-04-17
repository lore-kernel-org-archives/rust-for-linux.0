Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B7F343D64
	for <rust-for-linux@vger.kernel.org>; Fri, 17 Apr 2026 14:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776437587; cv=none; b=iFOvF6HPx56oqzeYEL8IjAJoxzIC5nQKzBZ3e3rBiDJ2BVq4c+osTB80CKGfb35oXWb9Z3CKztFgiry5hGQxLXD1RmMiZUhq5uHZSeLql1oIP/6Y/yVhsBCRN1lkPf6qFrd896uqTvVQ9Fi+Oc/PP7t5zc3mzAkV5z4n92kvY3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776437587; c=relaxed/simple;
	bh=w+jEvMypu34TxF/HMTYPqndABSSFqf1i1DK8TmibBdc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uTBqz/FjSKSnkw4i7y5LXQiYIwo4lA5QhsHnadogBTVbujVEyGtmMGWbHNSBOaygZsOOQC3QnYaMVXMkotkfhTfrl1fFPz+uIad5YmA2CoLeGbpqKIfoO6bgE8N5oAvhJPb9fsJ+TVJJR77Ry0wXkGcFxHO00IfsYnFep3La7FE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i4R7wPxq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i4R7wPxq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 704DAC2BCB8
	for <rust-for-linux@vger.kernel.org>; Fri, 17 Apr 2026 14:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776437587;
	bh=w+jEvMypu34TxF/HMTYPqndABSSFqf1i1DK8TmibBdc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=i4R7wPxq9/JsFzD/V4qumCZo9S+IeAasGjRd+0deehlV6gvGpRIE+U88TlosADVYp
	 W4Lh1STVbOYq4Aror5X0NlawCH0v/OH6W19pU9dz6xNMYQW57dOrmqIqsWJwboK58k
	 uIu6eBkelwx3m9Yjd09KHG46cDXUyvECYDIpyzmFP4iEFX10PD+yyPvdzri5MScz5F
	 bSMe5HsucmsRPfW5i/zKYoOJchoBixixfTfaB9gE5xhpYUuQ+1Z0ASYe3eUGjpbjPt
	 YlRMnNBcoKH1gzkSFHIDizSIji6rPTUaUIgK2Fz6q5wdkPxIvTxeMEWE46xfqgqYHd
	 5tAfbOh0i9gQQ==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-38e7b8e3f38so6245791fa.3
        for <rust-for-linux@vger.kernel.org>; Fri, 17 Apr 2026 07:53:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ996DEz3dM85iNq9xmOBgMoNAPPHyBdmAIuF4wXmhRJFK6qIiySiKh+/G95NFTvTFhf2lkfpjfMMf0M8nVquA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3Wk7qNcA1YVJR2Xwb8wD8z1zMjmvIuc1Lct5jWfqaczFdCv/8
	QMD6jGGrabD7wvVYsxPr82pCJabAWmzznrC1zZG/B7HCI096zyI6IChOS2CHrQJ2Tvo2Yb8gHoy
	fNWTEuMkqRbODltSXtLwRVtsAv6QJAW8=
X-Received: by 2002:a05:651c:1114:b0:38e:83a6:d4c with SMTP id
 38308e7fff4ca-38ec77f67a1mr10636321fa.7.1776437586121; Fri, 17 Apr 2026
 07:53:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260417-tyr-ioctls-deps-v1-0-41c6e9bb061c@linux.dev>
 <20260417-tyr-ioctls-deps-v1-4-41c6e9bb061c@linux.dev> <aeGKTIRFgBqHNI9S@casper.infradead.org>
 <df183bfe-21b9-4393-902d-18835e0bcf48@linux.dev>
In-Reply-To: <df183bfe-21b9-4393-902d-18835e0bcf48@linux.dev>
From: Tamir Duberstein <tamird@kernel.org>
Date: Fri, 17 Apr 2026 10:52:29 -0400
X-Gmail-Original-Message-ID: <CAJ-ks9=veRG_8SZ7CyzqdR2RhtJ6QZWozyo8oc-xnwoqpCdg6g@mail.gmail.com>
X-Gm-Features: AQROBzAPLPhYX_Clre1Isbc9aIHCBVWmh5wlFLJ8mxNzXW6XYYnQq98hgG8ihFk
Message-ID: <CAJ-ks9=veRG_8SZ7CyzqdR2RhtJ6QZWozyo8oc-xnwoqpCdg6g@mail.gmail.com>
Subject: Re: [PATCH 4/4] rust: xarray: Add Guard::find() helper
To: Alvin Sun <alvin.sun@linux.dev>
Cc: Matthew Wilcox <willy@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 16, 2026 at 10:17=E2=80=AFPM Alvin Sun <alvin.sun@linux.dev> wr=
ote:
>
>
> On 4/17/26 09:18, Matthew Wilcox wrote:
> > On Fri, Apr 17, 2026 at 09:05:54AM +0800, Alvin Sun wrote:
> >> Add a helper to find the first present entry in the XArray.
> > Why would you expose a function which does striclty less than the
> > underlying C implementation, rather than exposing all the functionality
> > that xa_find does?
> >
> >> Returns the index of the first present entry, or None if the array
> >> is empty.
> > Why not return the value found, like xa_find() does?
>
> Hi Matthew,
>
> Thanks for the feedback! I had considered both returning a tuple (key,
> &value)
> and an Entry struct, but only returned the key since that's all Tyr
> currently
> needs. I'll look at other Rust code to see which approach fits better, th=
en
> implement it properly in v2.
>
> Best regards,
> Alvin
>
> >
> > This is all very troubling.  I don't think Rust should depart from
> > what C has without good reason.
> >

More complete wrappers around the C APIs exist in Andreas'
https://lore.kernel.org/all/20260209-xarray-entry-send-v3-0-f777c65b8ae2@ke=
rnel.org/.
Perhaps we can borrow from that series?
