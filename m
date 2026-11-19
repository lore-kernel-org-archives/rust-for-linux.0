Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795084471;
	b=jmbtDicI2b8C4ZdW6wll3gtml6q4vUv97T5RSrGHIm7E005S6XtfN78SsejQKj1rSX4s
	 LD+3+kHyMSEr/ADaXrHP2pEzEEP4x0bdmCoVs8euO1z7c0eY2ajfHRdAlqCX9NroZArHy
	 NP4wspsR8dwxJ0Hxq2l41Nq9PGDKal/QId7ybLCTuKqycwnWLIdbY2owDLkznAm9u0NUg
	 j7DkitWfp2FwINYmBWZOjZmZpliy1vKOoU1yb3f3URIbBCjtG2wWexM2FBmKR17tQRdIT
	 hkMPf6Hm78Y0/7jTA1ONBGGR3kwT/Sqx6LHEkTKSZNaWTmoWelf128PCJPYUUVr4WIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795084471;
	h=Received:DKIM-Signature:Mime-Version:Content-Transfer-Encoding:
	 Content-Type:Date:Message-Id:Subject:Cc:To:From:References:
	 In-Reply-To;
	bh=r/LV8uKUhAkdDubPBIfVQFAg/c0ZWstIuqiCpM+nQM4=;
	b=cTVDRRiM9mBQZsVlGeYfqDWtbiJPDmMFAlS879erLpOFhLETyGv1cCKjfFbE46IwvZEX
	 ugFKODnDFNY4Alg27JHA0sEBt0HgfUE3Boqw4ZWLUF1VTHqUGvRHNLPcl2tTMCTWcbZUz
	 BQYNSa94qjD/hL8jQf1UlwEHicPTQEFMfOs2T/ZUtpB0oTDoenCH2SAGh2fyP65ff71Fm
	 JN8rdbcppP1UToO9+kb6aRt1zMnzpalkC0hlNnnkUJzbWghVQAx5UxEYBrZNh70OAZReY
	 rE4EEcIwit0FwHbw7EVDG4/WUmKksE/5j3Sb4sCxkuc/WE3rgETRRXBUT5bbgUbVigg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="PX/NEp2c";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07C9606A33A;
	Thu, 19 Nov 2026 10:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PX/NEp2c
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 098071F000C4;
	Thu, 19 Nov 2026 10:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795084471;
	bh=r/LV8uKUhAkdDubPBIfVQFAg/c0ZWstIuqiCpM+nQM4=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=PX/NEp2cjUqb/XyjeDzNWgCDHNUkJOZbWfDYM4GDACsgh0+d3hjHj6nE+o9K3ZCGK
	 oHCTdQlKmyThYmL9KLb5B5f+83sTmD4DkQnf7UrXCXblAkPWzMAjXHOc0+YP0CzfIJ
	 z7EjTUkNBVSbhFCivyam3Yl97jq3hMuoFSbx+MuRNtn2z1WM4dMHWWnm1bvx+1wmfX
	 XluXsNnTNRLdogYO27QLHi3b7Q7NTtrI51ltA8iYc45coE6HTNeck5Qg0UzBZ7OZ84
	 OTurByS112rxqk1If8Nv6T0bYhA+5wyni7/jILoaehSA1NN/PKg57LfTS+h4LzKPud
	 Tneh/ZGH8g9Gw==
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Nov 2026 11:34:26 +0100
Message-Id: <DMZ4C3GGD9U0.360KJBSFLEK61@kernel.org>
Subject: Re: [PATCH 1/4] drm/tyr: name resource lifetimes after their types
Cc: <aliceryhl@google.com>, <daniel.almeida@collabora.com>,
 <airlied@gmail.com>, <simona@ffwll.ch>, <lossin@kernel.org>,
 <ojeda@kernel.org>, <boqun@kernel.org>, <bjorn3_gh@protonmail.com>,
 <a.hindborg@kernel.org>, <tmgross@umich.edu>, <tamird@kernel.org>,
 <acourbot@nvidia.com>, <work@onurozkan.dev>,
 <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
To: "Gary Guo" <gary@garyguo.net>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20261118233727.3147222-1-dakr@kernel.org>
 <20261118233727.3147222-2-dakr@kernel.org>
 <DMYTKRS80NRC.18PBQHK9SZ8K9@garyguo.net>
In-Reply-To: <DMYTKRS80NRC.18PBQHK9SZ8K9@garyguo.net>

On Thu Nov 19, 2026 at 3:08 AM CET, Gary Guo wrote:
> On Wed Nov 18, 2026 at 11:37 PM GMT, Danilo Krummrich wrote:
>> The firmware, buffer, VM and MMU types use 'drm for their resource
>> lifetimes, even though each parameter is local to its type.
>
> This doesn't make any sense, a lifetime on a type by definition cannot re=
fer to
> a scope of itself.
>
> `'sec` is not the lifetime of `Section` and `'fw` is not the lifetime of
> `Firmware` and I think this is just confusing.

Yes, this was badly phrased. What is actually meant is that e.g. 'fw constr=
ains
how long a Firmware instance can be used.

(In the following patch, in TyrDrmRegistrationData, Firmware borrows Mmu. T=
hat
borrow has its own lifetime, distinct from TyrDrmRegistrationData's 'drm
parameter.)
