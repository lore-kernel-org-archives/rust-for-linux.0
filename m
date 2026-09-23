Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE359442396;
	Wed, 23 Sep 2026 09:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790155304; cv=none; b=jaBfXDGzHwWl2UwAemHLvKOFMJM1gTB1BFcqDL2UFDVnDDqlakPn6y9XYDSnhBYuiSaCOGYp4Y5eHQEwVlY2CQhn/Zfe90xm6BfyJMQOLu5epHo9SlCMi6pbSZ5ISVHgQ/+qHFSMMq3ux//kgDvk7V2pcrfvx1/e6un+zOXY6yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790155304; c=relaxed/simple;
	bh=oAixXAnaQxinHHkQ/rby2Wk4rk6fMGCMkLTBcOV+IsU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=thOXBgDfR2EAO84JTDg/w27t4pM5aJwxzZyO+MgUchdJSShVqEmcUi23r7XOd1YdBoFbgku4wVIUSEgCCT0zNFNaFC4Z0acwpQvSaHR5s0xzHlCPI0lS2kb6uAAdOnsAzfxEe8oBnvff880WI/1ZwHf04cPd6nVwz1QluyrxDJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=hsV1VpEI; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="hsV1VpEI"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4hqWgP6fWWzMlcN;
	Wed, 23 Sep 2026 11:21:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1790155297; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oAixXAnaQxinHHkQ/rby2Wk4rk6fMGCMkLTBcOV+IsU=;
	b=hsV1VpEIcbfAY97859a01N4NfGJ1qfkYQ3qQDzvGI09N3qFlULRneVEir627XR5eolXIdw
	5RrkkOPWp5H54LzL4Sp4h9TtXn+DVUxJ93vxkHhohRl6y+c8A7t9HDNYWHRBwIi0fz54Gy
	lpGV3DMWLLVkxnDIxpS0DH44l61v1dDjoGR6ZMdDJty4cyNwwq6c1xkXWW6vV9pXOe6vPA
	/bl/H+fjLKLagm13Z3OMmuWLqS5hiQaBMtdyQphynQz305m6osjNHtIv3BN3eLNsQCeMZy
	gUpBOavYW/2suWPmXnP0lEdKHEb0QDbhExZioHGGa/oLmVFFiEzVceATJr7GnQ==
Message-ID: <ffad51ef7d5f20d21396c84362fbdd2ac5883116.camel@mailbox.org>
Subject: Re: [PATCH v11 1/2] rust: Add dma_fence abstractions
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo
	 <gary@garyguo.net>, =?ISO-8859-1?Q?Bj=F6rn?= Roy Baron	
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas
 Hindborg	 <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross	 <tmgross@umich.edu>, Daniel Almeida
 <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>, Onur =?ISO-8859-1?Q?=D6zkan?=	
 <work@onurozkan.dev>, Sumit Semwal <sumit.semwal@linaro.org>, Christian
 =?ISO-8859-1?Q?K=F6nig?=	 <christian.koenig@amd.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,  "Yury Norov (NVIDIA)"	
 <yury.norov@gmail.com>, Asahi Lina <lina+kernel@asahilina.net>, Burak Emir	
 <burak.emir@gmail.com>, Lorenzo Stoakes <ljs@kernel.org>, Joel Fernandes	
 <joelagnelf@nvidia.com>, FUJITA Tomonori <fujita.tomonori@gmail.com>, Boris
 Brezillon <boris.brezillon@collabora.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org
Date: Wed, 23 Sep 2026 11:21:26 +0200
In-Reply-To: <DL9AEUZ4VGV5.2RT33JE0MHYME@kernel.org>
References: <20260905085343.1827305-2-phasta@kernel.org>
	 <20260905085343.1827305-3-phasta@kernel.org>
	 <DL9AEUZ4VGV5.2RT33JE0MHYME@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: ee915ba95aed2083b9c
X-MBO-RS-META: gc4f65s5boyqeb8nrisbs9xnw697ra6q

On Mon, 2026-09-07 at 20:14 +0200, Danilo Krummrich wrote:
> On Sat Sep 5, 2026 at 10:53 AM CEST, Philipp Stanner wrote:
> > +impl<'a, T: Send + Sync + FenceContextOps> Drop for DriverFence<'a, T>=
 {
> > +=C2=A0=C2=A0=C2=A0 fn drop(&mut self) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let guard =3D self.as_fence=
().lock();
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // Use dma_fence_test_signa=
led_flag() instead of
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // dma_fence_is_signaled_lo=
cked() because the C backend wants to get rid
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // of the latter.
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: `guard` is valid=
 until the `call_rcu()` below.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let signaled: bool =3D unsa=
fe { bindings::dma_fence_test_signaled_flag(guard.as_raw()) };
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if !signaled {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pr_=
err!("DriverFence drops unsignaled. Danger of memory corruption!\n");
>=20
> I'm not sure we want to keep this as pr_err!().
>=20
> If we really want to keep warning about this I'd either make this a WARN_=
ON() or
> dev_warn() (we can easily store a device reference in the fence context),=
 such
> that it is at least clear who's the offender.
>=20
> My preference would be dev_warn(), as I don't think it is that bad of an =
error
> condition to begin with. It would be pretty odd to have a driver where a =
DriverFence
> drops while the corresponding GPU job is not dropped. And further it'd be=
 pretty
> odd if dropping the GPU job would not imply that the GPU actually stopped
> processing the work associated with the job.

Yeah, it would be odd. I would not expect it to happen. But many things
have happened which I did not expect, so =E2=80=A6 :)

>=20
> For the same reason I also think it is a bit misleading to say "Danger of=
 memory
> corruption!". It's not the signaling of the fence that does prevent memor=
y
> corruption; it's the driver implementing a proper teardown sequence. And =
if this
> sequence is structurally detached from the lifetime of the DriverFence (a=
nd Job)
> structure, something is structurally wrong with the driver anyway.

Hypothetically, it could mean that there is a forgotten job still
running on the GPU, which might then access freed resources through
DMA. Sure, that would mean that the driver is fundamentally broken, but
that's what warnings like that are about.

Just to ellaborate on my thinking. I wouldn't insist on any wording.
From my POV we can just say "=E2=80=A6 drops unsignaled.". That should be
enough.

>=20
> Furthermore, it would be very natural to just require the generic Job typ=
e to
> own a DriverFence. In this case it becomes natural to either signal the f=
ence on
> Job completion, or just drop the Jobqueue, which does the ring teardown a=
nd
> subsequently drops all the Jobs, which would also imply signaling the
> DriverFence with ECANCELED. I.e. I think the fact that the DriverFence is
> signaled with ECANCELED if it is still unsignaled should just be an API c=
ontract
> and not an error condition.

Yup, with the JobQueue design I have in mind this error is largely
impossible, just as the forgetting of DriverFences is. Which is why I
think it's a good design idea to have the JQ own the jobs, isolating
the driver from direct fence interaction.


P.
