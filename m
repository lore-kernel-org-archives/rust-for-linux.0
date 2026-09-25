Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 910B94B0E28;
	Fri, 25 Sep 2026 16:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790352032; cv=none; b=Ne23hJFBAFr1BtSfahtVPP5MvXB+eJnfUeyW7ZkNOSJ4IpNasBYPyRKurJJSheGsP9hv570v79Gg09vQrmRto4w3F4abddQaAnhXOGhtdDAdfsQyXdLaB/A34YrnqI8HgnSKirEvlBqfsu1zVTKLS/+ETQ2aiIrl3J3zVUh7kW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790352032; c=relaxed/simple;
	bh=ywbxnRCzIpxZKcKA4407lYkAqXuRPUNreym6wXcGaS4=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=DHoEk4w5QrqYkH+UBxXVGBS8eXDxs4cyKZLWbbAhpiJ4xDw70PiMsVjS9Q8/HmSZceji/HrQx/QGnWNUiu9pLm+bl8oLIZRP9Pzj8+Fty6onl6UaMhAWDnYwnVOxNPH91VQbTJ9nSj2lzmteJ66vjRP/6GnNT+MOX58QNrYZ93c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bmheRZQj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bmheRZQj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B1AC1F000FF;
	Fri, 25 Sep 2026 16:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790352031;
	bh=ywbxnRCzIpxZKcKA4407lYkAqXuRPUNreym6wXcGaS4=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To;
	b=bmheRZQjozopfrBYggaWB3DB6Wc6c8qJSjI5FAbid7Q8XlDH4jWun8/xfVeQsZOa1
	 0LekADVIjGA/2jD8QqVB6550Jmzu4LENyLmdrW0dPFkP+7SjdjRdA0dIPL103D+Aek
	 XoWv0oLq1IZpdeuaENP4VYY50WxskNsPFR46ZSxqmOleeXjgNxsKSUaYU6wGXRFuZp
	 4VQAsZa7kTzNl2VFG9xtnREZaiuzYwctfcav729Od0h1QZuArQRk6gEmuyUnpJVZWq
	 mVz2p84rCmhLPNg4gmE6WTclK0w7i4xe3srzy1geMBNLqUSTDvt9T1wRohumLs3lNJ
	 PAQkAnbNBRB3A==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 25 Sep 2026 18:00:25 +0200
Message-Id: <DLOITQ94Y374.2HQ1HVK4G8D40@kernel.org>
To: "Philipp Stanner" <phasta@mailbox.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH] rust: DmaFence: Add better warning through Device
 reference
Cc: <phasta@kernel.org>, "Gary Guo" <gary@garyguo.net>, "Alice Ryhl"
 <aliceryhl@google.com>, "Sumit Semwal" <sumit.semwal@linaro.org>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Tamir Duberstein" <tamird@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, <linux-media@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
References: <20260925081958.3048112-2-phasta@kernel.org>
 <DLOBPY6OBEOG.2Y4I4LRA276WU@garyguo.net>
 <DLOECU7X3MTR.31Z6N1I0WB0MJ@kernel.org>
 <f0248d1529378ab8be957009a93a0a73ee74bafb.camel@mailbox.org>
In-Reply-To: <f0248d1529378ab8be957009a93a0a73ee74bafb.camel@mailbox.org>

On Fri Sep 25, 2026 at 3:08 PM CEST, Philipp Stanner wrote:
> On Fri, 2026-09-25 at 14:30 +0200, Danilo Krummrich wrote:
>> On Fri Sep 25, 2026 at 12:26 PM CEST, Gary Guo wrote:
>> > On Fri Sep 25, 2026 at 9:19 AM BST, Philipp Stanner wrote:
>> > > Replace the warning print with a dev_warn!(). To do so, have the
>> > > FenceContext carry a reference to a Device, protected by the already
>> > > present lifetime.
>> >=20
>> > Add a lifetime just to do this a print doesn't sound ideal. You could =
use
>> > `ARef<Device>` instead?
>>=20
>> Yes, that's what I recommend in general.
>
> Weren't you super opposed to refcounting wherever it's avoidable?

Well, a device by itself is already reference counted (which is fine). The
lifetime constraint does not come from the lifetime of a struct device, it =
comes
from it being bound to a driver for bus devices; for class devices the life=
time
constraint comes from the device being registered.

I'm opposed to refcount stuff that has a bounded lifetime that is defined b=
y
some scope it must not outlive.
