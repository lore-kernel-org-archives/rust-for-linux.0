Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FECA30F531;
	Tue, 10 Feb 2026 12:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770727761; cv=none; b=ly41VXz4vsNY8gAdz7r7NFMxZ82AK/9V5GI+/fu/G5Fv2QaeAK1YVDOlXNQGsDJtxG2/I0W8QB/7aDcgJ3Rnw08wUz5BGveJ+Vr2AGNlrxjyvUUrs4LLDdqrcCrZNRGZe2D6niCW6jr4GhdFB7N847vM1V2ICNxGDdhjUN2kHYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770727761; c=relaxed/simple;
	bh=bRBzJsgd1DT/hfRz6GUkWQh8vcm590qGFKPFrEj7lk4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h6TdJijED7WK2gAOlvxLQBXgk1puIYKIc87eyrW10zVtpOXqkNnsb3eHRi3knSXpxROcZmplv8XjDftglRAwHib0/aCVzM2uphB03X+NsFlc/Tbi0UhoQxaBXl1RQWp2oL8+QjDjyr/THEV+MlAD1F/vu/RN6IhhbOYiyg6dKpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=jQ1PTkw6; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="jQ1PTkw6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770727758;
	bh=bRBzJsgd1DT/hfRz6GUkWQh8vcm590qGFKPFrEj7lk4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=jQ1PTkw6UCmS++9/erQMyE97XgMk8NYS3hSZ4mA9CU5EVMLPhemWXMWAZ+5nA3dEV
	 JtpyDitIqOju0ubmrdM3QF9ArcKb9T7NEHZfPPT4NyAf/iBbzQiGsjp9aOOWBMGtSM
	 iXAu19fXxJns8WEO7+96Z4fFzSVaodW808ezoDTh0cxEfA0nwdAjJvnlALKD/tfi9n
	 hsWiLezo+YC+5+gmIEHKjYZ85A3c4AEMhFSwh7lQ57Jw0t04EyrJg5Cv1VvkzMOK8B
	 Q9f99xRq/7rwL1WbHn2f0ojIZXrWcZPX7mo5xmWnHm5lN81A2SevBYPLAxCKNszbbl
	 nda5pI8Qjqn0w==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 26C0217E114C;
	Tue, 10 Feb 2026 13:49:18 +0100 (CET)
Date: Tue, 10 Feb 2026 13:49:13 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: "Christian =?UTF-8?B?S8O2bmln?=" <christian.koenig@amd.com>, Philipp
 Stanner <phasta@mailbox.org>, phasta@kernel.org, Danilo Krummrich
 <dakr@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Gary Guo <gary@garyguo.net>, Benno Lossin
 <lossin@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, Joel
 Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Subject: Re: [RFC PATCH 2/4] rust: sync: Add dma_fence abstractions
Message-ID: <20260210134913.33cb674f@fedora>
In-Reply-To: <aYsFKOVrsMQeAHoi@google.com>
References: <20260203081403.68733-2-phasta@kernel.org>
	<20260203081403.68733-4-phasta@kernel.org>
	<20260205095727.4c3e2941@fedora>
	<DG7SZND1GWR4.3C5NLKY4SYC0M@kernel.org>
	<bb57b6837aa8044e679dad5f2589c2e0ba84c221.camel@mailbox.org>
	<20260209155843.725dcfe1@fedora>
	<c319c349-eb95-4c38-84fb-47440daefc3b@amd.com>
	<aYruaIxn8sMXVI0r@google.com>
	<20260210101525.7fb85f25@fedora>
	<aYsFKOVrsMQeAHoi@google.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 10 Feb 2026 10:15:04 +0000
Alice Ryhl <aliceryhl@google.com> wrote:

> /// The owner of this value must ensure that this fence is signalled.
> struct MustBeSignalled<'fence> { ... }
> /// Proof value indicating that the fence has either already been
> /// signalled, or it will be. The lifetime ensures that you cannot mix
> /// up the proof value.
> struct WillBeSignalled<'fence> { ... }

Sorry, I have more questions, unfortunately. Seems that
{Must,Will}BeSignalled are targeting specific fences (at least that's
what the doc and 'fence lifetime says), but in practice, the WorkItem
backing the scheduler can queue 0-N jobs (0 if no jobs have their deps
met, and N > 1 if more than one job is ready). Similarly, an IRQ
handler can signal 0-N fences (can be that the IRQ has nothing to do we
job completion, or, it can be that multiple jobs have completed). How
is this MustBeSignalled object going to be instantiated in practice if
it's done before the DmaFenceWorkItem::run() function is called?
