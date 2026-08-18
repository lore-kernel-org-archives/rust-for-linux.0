Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7FB92744F;
	Tue, 18 Aug 2026 14:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787062589; cv=none; b=S1yQeovqy9Kd0gq7HXf73zcgnpzR0xaVobCiL6Tyc6rYnt5+Cuyz58gmJiJUCSRqEFsQGKpO1as23l6kySIvlGrd+TMs5Jr7tu23gVEqL/RA/ciyW4iP/l9n+xsx7jGToP3ooXCEZMHimfrU87P7J9jTJYWE/jAXqLgsnwHLB5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787062589; c=relaxed/simple;
	bh=cWQ++mgTrEIzLroMukFq0AintJC+QDmvdZuVBe3r9B0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JkT6l2XI0c5+y6jwonF+SjiTuRcNLcnnLxZbTacr80LScCj8l0gaUGbi8hewim3GqqPQ0RqOHV2UfV3MUHVM138UsJ9goGWvT9rX9i9ORNp5xfZyFdnMdltwTjo5yYbRkyQLm5fikypgKgnGhHMav6SeToNJCBE/pSy9Hr4bim0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MhlO1Gz+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MhlO1Gz+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 985FB1F00A3D;
	Tue, 18 Aug 2026 14:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787062588;
	bh=XQROgKAhXbkLaZSRrK5U1fUPvmvOBfDeQ6LfReQ2zug=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MhlO1Gz+9xG6lTMBU7D/q6Usi2k6uCq6GhfE8LK+7Uaf6diW2PP++W2tHiMH+f2BS
	 3U7t0/oAXQqJhWh1RficbeRADZ7LjfNMHqFddcAe5g/dEW3sBb89VfyofDvrkXy0TZ
	 gSjxe9b4GLOSdw1LJBBxGuWiDjVWPFQUAO1ooFMUfYftNDuJWVmKcA2GuXeqYcip3R
	 WxcsUPpk0G6hFhhzsZBYWRaVfcAke3Y1v6Qua7Ny/AhRqNFnpYsAse6+Va95r+WL30
	 C+uEGSbu4PsXIYJ9HZS9iV2BgzXwXI5T5n+TF+Y5VRJsXgb1sS/W6T41n9xwG2oJR7
	 8QeGY+HNZd0pg==
Date: Tue, 18 Aug 2026 15:16:21 +0100
From: Mark Brown <broonie@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>,
	Dave Jiang <dave.jiang@intel.com>,
	Saeed Mahameed <saeedm@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
	Benno Lossin <lossin@kernel.org>, linux-next@vger.kernel.org,
	Jonathan Cameron <jic23@kernel.org>, rust-for-linux@vger.kernel.org,
	Boqun Feng <boqun@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>
Subject: Re: [PATCH -next] rust: fwctl: replace `__pinned_init` with
 `raw_try_init`
Message-ID: <0e0c9ee9-ce44-49cf-b5c5-3764f260f1b5@sirena.org.uk>
References: <20260818105350.361218-1-ojeda@kernel.org>
 <20260818125558.GB5432@nvidia.com>
 <DKS3G1HH0835.P8T7VT9VW24I@garyguo.net>
 <20260818132022.GC5432@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bqy/X03rGxBGikgC"
Content-Disposition: inline
In-Reply-To: <20260818132022.GC5432@nvidia.com>
X-Cookie: Smile!  You're on Candid Camera.


--bqy/X03rGxBGikgC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 18, 2026 at 10:20:22AM -0300, Jason Gunthorpe wrote:
> On Tue, Aug 18, 2026 at 02:11:57PM +0100, Gary Guo wrote:

> > I'm not sure how this break everyone elses' branches? It only breaks linux-next
> > but that's why it exists in the first place, to catch tree
> > conflicts.

> linux-next is to catch missed things, you shouldn't use it to
> purposefully cause conflicts during the merge window..

> So for example introduce your new API and do some conversions, then
> remove the old API down the road after the merge window is a more
> expected work flow.

So are these updates that are requiring frequent patching up aren't
forced as a result of some Rust language thing but rather deliberate
decisions?  In that case I tend to agree with Jason, I'd not expect to
see changes like these coming in during the merge window without a
strong reason, and with C changes like these would normally be done in a
much more coordinated fashion - for example an overlap period like Jason
suggests, possibly with shared branches.

I'd been under the impression that the reason this was happening a lot
with Rust was something to do with how the language works.

--bqy/X03rGxBGikgC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqEaTUACgkQJNaLcl1U
h9Dx2wf+KVxQXvWwQz1RfSqKQz4y+LN2Um3SPFzbVBtmvwy40YdJFAotPZkHUx80
HT8tZV89GnEbfLnJ7dN1fvAt81OjU9TuKnEPIwuuFFVf19dqEn1fEE7ccE5hCXb/
B2S8RNXzRwmxUKIheWeTUX7Nk9H/8JEPR+OYfhegKVw/ljskwc3y0DhHhT1xy6VU
x3ZW8SAl1lBrIJesKVvqN+PIm9EWu1Fr5LXgRsQldriWFaI+DBXiJx+o8yFY0097
YVOoBoU5HcxQF1aehxM/gliSPLdDtmchh1kTk/xqJqvlqEnauWrC85uAMlCNQt6m
zObLtb6DD9h+HJb0VYAc1r9+5b3l9Q==
=HpEA
-----END PGP SIGNATURE-----

--bqy/X03rGxBGikgC--
