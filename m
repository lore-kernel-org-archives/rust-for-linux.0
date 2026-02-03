Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8058F2F3621;
	Tue,  3 Feb 2026 15:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770131958; cv=none; b=TsdAzWS3+hnFFKg1CBJ3r5Yxug+88eZEG5vGugMIii7/NCYUJCsDCPfdJx/FNkoW4+zSn9B/bnhaXM2DtlDYZTsUEVs8JI9mtuLPdtV+s1iJW+A8VxeGp1MEETUf/91ECpeJ2+M1hzYYEp7zT6icBlT97n/s+bcjrjJiG33/Td4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770131958; c=relaxed/simple;
	bh=c+Pdn9V3tnViCoJ+0OXkOAVgltVy8KlqX++J+VFT8NE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=BONC8O+CbjcNJq0DydXVbaB9eJUq1yWNN0nbdJZ6PvgUcESMZ5I2FO4eLPNyo88P4ixM+ibDiyDRtIXIoefk8x4nJhiWdtx/UT5vTAfNp8wZYUOOqrs7Dg0hOsnyoilCCgL9j4RW+tS8UtyehchbVwzmtej1lhuG21AVeqxxho8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k0HByKPX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k0HByKPX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22A78C116D0;
	Tue,  3 Feb 2026 15:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770131958;
	bh=c+Pdn9V3tnViCoJ+0OXkOAVgltVy8KlqX++J+VFT8NE=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
	b=k0HByKPXEQqer3A3Jn/UU0WRn2GMklsrPe+AKZs1z6AHDNGKJatH13XdfUfwXMYGE
	 Tsv85d2krhVxnkWt3bINg/t3Aq+LZEEQfcsQjlIKscbQ2UZxqhh3Du9g/3OjUlaPd5
	 4Z4FBbTqIUlmu/+iblM1aouVqi6GR9XNPPmUzxAfXTZTUla7D7jj7DX1yazsqAMkOV
	 X09dDZ+FAqwCfdPNHVfO4UTjfPWzGVEyQzITMEPaPkgLBfBw1CM6hegzslHH9dQtS0
	 FiuUaS1kahbSF3yTX7rHlajZQonCDoYcIq1KAruzqgBrGdz+tsRm2UyI3YaEdsnkd1
	 0I+wu/N56n7hA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Feb 2026 16:19:14 +0100
Message-Id: <DG5FEPO6RCK4.17KOY7PRLNFKV@kernel.org>
Cc: <cmllamas@google.com>, <gregkh@linuxfoundation.org>,
 <aliceryhl@google.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <lorenzo.stoakes@oracle.com>,
 <vbabka@suse.cz>, <Liam.Howlett@oracle.com>, <urezki@gmail.com>
To: "Shivam Kalra" <shivamklr@cock.li>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v2 1/3] rust: alloc: Add shrink_to and shrink_to_fit
 methods to Vec
References: <20260131154016.270385-1-shivamklr@cock.li>
 <20260131154016.270385-2-shivamklr@cock.li>
In-Reply-To: <20260131154016.270385-2-shivamklr@cock.li>

On Sat Jan 31, 2026 at 4:40 PM CET, Shivam Kalra wrote:
> This implementation guarantees shrinking (unless already optimal),
> because the kernel allocators don't support in-place shrinking,
> a new allocation is always made.

I'm not sure we should go in this direction. There is a reason why krealloc=
()
does not migrate memory between kmalloc buckets, i.e. the cost of migration=
 vs.
memory saving.

For Vmalloc buffers the story is a bit different though. When I wrote vreal=
loc()
I left some TODO comments [1][2].

  (1) If a smaller buffer is requested we can shrink the vm_area, i.e. unma=
p and
      free unused pages.

  (2) If a bigger buffer is requested we can grow the vm_area, i.e. allocat=
e and
      map additional pages. (At least as long as we have enough space in th=
e
      virtual address space.)

So, I think we should just use A::realloc(), leave the rest to the underlyi=
ng
specific realloc() implementations and address the TODOs in vrealloc() if
necessary.

[1] https://elixir.bootlin.com/linux/v6.18.6/source/mm/vmalloc.c#L4162
[2] https://elixir.bootlin.com/linux/v6.18.6/source/mm/vmalloc.c#L4192
