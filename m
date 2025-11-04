Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5289325702;
	Tue,  4 Nov 2025 14:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762268155; cv=none; b=acZb1xoiUPLrsR7H6xLkZKsZBi3DoCEXqt24g6zNLOdxdwZ9yIRY99d6xScXDcZpZBhef3uM2JA1Uv9qQvFHMBoArziJSklPy7z8Ec2YEeQEjUkLrY9t8MH2apAt/lD2xYT+jtVO4WzIohPenY+g935+c35jDYRrmXiMtbOwamg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762268155; c=relaxed/simple;
	bh=n8WRaMUnH5MGGj5wLdKF7JioxWhUOsIFKKaUCGerXYY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=XJZ5srrFQsJpV0WbBGHAoLIKFCHWAtpGOuEoxOzbpEA07CTsqp+MbUf8FuW4vvKl5fRzqhrjyL3E/MjspYpAKRbl6e++vbDx2xbqVaV9UhDYn4Y1xg4B4SvXBbb4NghwbVK5AhQwnT7zI3khU1jNI+OXidlNp2/kd6hDW73zo4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XCVsVhQv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XCVsVhQv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7B37C4CEF7;
	Tue,  4 Nov 2025 14:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762268155;
	bh=n8WRaMUnH5MGGj5wLdKF7JioxWhUOsIFKKaUCGerXYY=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=XCVsVhQvdbIfCJNb6VSThwF+MbDnLJ/WnpP4rrKhCJsl/ClkSgCm2uUBEB4mLD+Ua
	 HxwcbIBW52DFoXJ/JTme/DrPIxScnSz32kP1V9rm/+ewc8KgBxOrQvcdl1SIJbqdKb
	 TKioZNVGzb+UGoQD80VTJlndB0Epc8UfKDepfCjomcfhMwumq1VO8RIjf0fErHFl2g
	 zx+T4V5onPAC2JQDP0SwFCBBKU1X2q8+pvwtoVmaxvsbNamI8iD0Xzwol6pBS1DhOo
	 lUlpUg4Bg2t2539a9MH5cQredG6g1G9biNrdIwR2K/QfWBe0sHLQMkVQi/JfFwUF/t
	 /SM6T7aKnI3lw==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 04 Nov 2025 15:55:51 +0100
Message-Id: <DDZZX8AJKTP3.2OTD2L9ULVUG0@kernel.org>
Subject: Re: [PATCH 1/2] rust: dma: make use of start_ptr() and
 start_ptr_mut()
Cc: <abdiel.janulgue@gmail.com>, <daniel.almeida@collabora.com>,
 <robin.murphy@arm.com>, <a.hindborg@kernel.org>, <ojeda@kernel.org>,
 <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>, <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, <lossin@kernel.org>, <tmgross@umich.edu>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20251103190655.2326191-1-dakr@kernel.org>
 <aQm7qLybSn6bOlCy@google.com>
 <ad2963c2-3d44-4b6d-b975-75a9ea96ba1c@kernel.org>
 <aQoOS9MQ8PDBYKtk@google.com>
In-Reply-To: <aQoOS9MQ8PDBYKtk@google.com>

On Tue Nov 4, 2025 at 3:31 PM CET, Alice Ryhl wrote:
> On Tue, Nov 04, 2025 at 10:13:08AM +0100, Danilo Krummrich wrote:
>> On 11/4/25 9:39 AM, Alice Ryhl wrote:
>> > On Mon, Nov 03, 2025 at 08:06:49PM +0100, Danilo Krummrich wrote:
>> >> Using start_ptr() and start_ptr_mut() has the advantage that we inher=
it
>> >> the requirements the a mutable or immutable reference from those
>> >> methods.
>> >>
>> >> Hence, use them instead of self.cpu_addr.
>> >>
>> >> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
>> >=20
>> >>          // and we've just checked that the range and index is within=
 bounds.
>> >>          // - `offset` can't overflow since it is smaller than `self.=
count` and we've checked
>> >>          // that `self.count` won't overflow early in the constructor=
.
>> >> -        Ok(unsafe { self.cpu_addr.add(offset) })
>> >> +        Ok(unsafe { self.start_ptr().cast_mut().add(offset) })
>> >=20
>> > I guess this shows that the mutable/immutable requirements we inherit
>> > aren't actually what we need?
>>=20
>> item_from_index() is used for the dma_read!() and dma_write!() macros, h=
ence
>> this one is on purpose.
>
> I guess it's more that you don't really need mutable access to call
> start_ptr_mut() for this particular case?

In general I think it's good to require a mutable reference for start_ptr_m=
ut(),
as in the absolute majority of cases we actually want to inherit exclusive
access.

As you say, in this particular case we do not want to inherit exclusive acc=
ess
on purpose.
