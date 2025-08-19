Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2AE3451BA
	for <rust-for-linux@vger.kernel.org>; Tue, 19 Aug 2025 12:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755605180; cv=none; b=dzrJWLYBLrdpH0pYCMe1xzujLN/1Os4pwF4Ex0u76SiZrt+LX7K/dClPufRVjfdU9bEKg6+4xHn5iJLQl5LT1w2WvEM/brXJbw4XXNZofQfL+cw902WH+hIj7osRwVmzvZvrEYZDlnFVPuYYbI43mzoG6CEo8uCdCRoJrCmIetc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755605180; c=relaxed/simple;
	bh=859UABHuUBpib2V2HDvLBL6WGjw48U6s5cPPVaGnJ28=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=tGrCOHDzOf4djaM/q2aWCoZ5ad6oURTgb6Pz8oOIeJUPV9D9R6n4sh6ehDYadtqGOabjfLQpUp1NddWh8qPU7E5snrRVNre8i/kY6nG7d19ZqQ7kehJiiaaEiM0HAZeUw1bEDqHAgxduM7sC6XSP2nOwFFW/KtvWEHujwlV7YMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TbStd50d; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TbStd50d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F31FAC113D0;
	Tue, 19 Aug 2025 12:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755605178;
	bh=859UABHuUBpib2V2HDvLBL6WGjw48U6s5cPPVaGnJ28=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=TbStd50dd6YkeMv32sRVX3R2tdV1xIy96aCaTjk9Et91X7SJmQr8lCFJCv/uaVP6v
	 +NrP67cCqD78BJw+f8vfAuAaVizrsEBlaQoHB6m8/zlxcm0MJuslPBD82Zh7M/Z1RB
	 ZQNpdYiFZ4EraJ98Hw3wjARyHV8XFSdZAKCxDdKIYSCOnIL23hxCMW653PAhovYAKW
	 83tAjp/3/03ZYE/M1Ev6zF1C9NbuHkbEBhi5aLmqYkNpDLkTkJ028STUI2cnCWDdyN
	 CG1DsltmftJa8RULjGEScAJvysxtympM2RynvqCmSYOXBQlt0vf3eX77mOKqdUH2/d
	 AYAaM/xm5jfQQ==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 19 Aug 2025 14:06:14 +0200
Message-Id: <DC6E3F2JUWHZ.L43CYLWIAMYJ@kernel.org>
Subject: Re: [PATCH v4 5/7] rust: alloc: kbox: implement AsPageIter for VBox
Cc: <lorenzo.stoakes@oracle.com>, <vbabka@suse.cz>,
 <Liam.Howlett@oracle.com>, <urezki@gmail.com>, <ojeda@kernel.org>,
 <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>, <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, <lossin@kernel.org>, <a.hindborg@kernel.org>,
 <tmgross@umich.edu>, <abdiel.janulgue@gmail.com>, <acourbot@nvidia.com>,
 <rust-for-linux@vger.kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20250814093427.19629-1-dakr@kernel.org>
 <20250814093427.19629-6-dakr@kernel.org> <aKRlDPozTqtJL556@google.com>
In-Reply-To: <aKRlDPozTqtJL556@google.com>

On Tue Aug 19, 2025 at 1:50 PM CEST, Alice Ryhl wrote:
>> +impl<T> AsPageIter for VBox<T> {
>> +    type Iter<'a>
>> +        =3D VmallocPageIter<'a>
>> +    where
>> +        T: 'a;
>
> Are you sure you ran rustfmt on this?

Heh! Yes, I am.

It seems like I'm pretty unlucky in terms of running into rustfmt quirks. I
think I spotted another weired formatting introduced by rustfmt in the
scatterlist patches.
