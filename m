Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63BF140FDA4;
	Thu,  5 Feb 2026 14:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770303420; cv=none; b=VOeqYPAn1Pi7oq9358IKi4wRWfcF21o1D2ZAhulHjURIDwCGLQxRlOSGqeAO15vcfO2P5WnSiYAx7XUpXYo+yXLNJD5lQ9j0v137YsNCLyDDMo8sVS42w7WXKA+q7IiR5/Rsccl/DvxcaZODSVm4GuGsG/R0movtK7I3QMwiLbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770303420; c=relaxed/simple;
	bh=gMmsQzoS6PLGmI/k3RPElkgBbzOIjikIFD020ivXMLE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=I5AoAUbEXpdE1BSJOxzxXr6Wh8YuwUfMjNLzL+otV60nDXJs7uQq+K9A0c83FzL16OIGw3sZ2y29gUEarPqeEgBx2jCAX0tlGQPeOEFYAq5AjYvIC/yoTvHTAYvUPWG3mcTjou+W374JS2NhfxZJzECcK6ycsm7A4HcNziDgaTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E/58bSTR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E/58bSTR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8A20C4CEF7;
	Thu,  5 Feb 2026 14:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770303419;
	bh=gMmsQzoS6PLGmI/k3RPElkgBbzOIjikIFD020ivXMLE=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=E/58bSTRIAF2nMzj3w1phnYwa5sjfbTDc484MGSp0cUDxYfH8kjLuLyzUw0ZnUE+j
	 D8A5WFmrQ4i1E7rGsOpwApJc24jcWQmblYfYRMR7odI8SR0fHDKIR73gq30BDZxuAI
	 5JFk5ex2pdJWaTFjurJUZVE6X09Sa+OV+bbIXxMvidYn5gAami7E9USVEt6gG8ctm+
	 YKnvpo/r7z5pP1GHhdHOJ0NkPvUsTsMHZbzHrK0VUYGf6BB/rvIQqZMrY6w/64+5On
	 UJ5UlV+gIX1dlsDipGrKlfzXu0iOjR2DdnMAURdGYp8vnpRHGTJ7MGd/9B7GPoKIrS
	 NYFkT20GbQvKQ==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Feb 2026 15:56:51 +0100
Message-Id: <DG746O6SKUQ0.H2A7OAVXTFZB@kernel.org>
Subject: Re: [PATCH v2 1/4] rust: io: Add big-endian read and write
 functions
Cc: "Link Mauve" <linkmauve@linkmauve.fr>, <rust-for-linux@vger.kernel.org>,
 "Madhavan Srinivasan" <maddy@linux.ibm.com>, "Michael Ellerman"
 <mpe@ellerman.id.au>, "Nicholas Piggin" <npiggin@gmail.com>, "Christophe
 Leroy (CS GROUP)" <chleroy@kernel.org>, "Srinivas Kandagatla"
 <srini@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Ard
 Biesheuvel" <ardb@kernel.org>, "Martin K. Petersen"
 <martin.petersen@oracle.com>, "Eric Biggers" <ebiggers@google.com>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, "Lyude Paul"
 <lyude@redhat.com>, "Asahi Lina" <lina+kernel@asahilina.net>, "Viresh
 Kumar" <viresh.kumar@linaro.org>, "Lorenzo Stoakes"
 <lorenzo.stoakes@oracle.com>, "Tamir Duberstein" <tamird@kernel.org>,
 "FUJITA Tomonori" <fujita.tomonori@gmail.com>,
 <linuxppc-dev@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
 <officialTechflashYT@gmail.com>, "Ash Logan" <ash@heyquark.com>, "Roberto
 Van Eeden" <rw-r-r-0644@protonmail.com>,
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: "Daniel Almeida" <daniel.almeida@collabora.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260204040505.8447-1-linkmauve@linkmauve.fr>
 <20260204040505.8447-2-linkmauve@linkmauve.fr>
 <DG6A0WRA0JZC.SPDT9WEXF92K@kernel.org>
 <EC479D9E-ADBF-461C-BEA6-06EA2D4FD8A6@collabora.com>
In-Reply-To: <EC479D9E-ADBF-461C-BEA6-06EA2D4FD8A6@collabora.com>

On Thu Feb 5, 2026 at 3:28 PM CET, Daniel Almeida wrote:
>
>
>> On 4 Feb 2026, at 12:18, Danilo Krummrich <dakr@kernel.org> wrote:
>>=20
>> On Wed Feb 4, 2026 at 5:04 AM CET, Link Mauve wrote:
>>> Another option would be to call u32::swap_bytes() on the data being
>>> read/written, but these helpers make the Rust code as ergonomic as the =
C
>>> code.
>>>=20
>>> Signed-off-by: Link Mauve <linkmauve@linkmauve.fr>
>>=20
>> The I/O stuff recently changed quite significantly, please have a look a=
t the
>> driver-core-next branch [1] in the driver-core tree.
>>=20
>> Also, instead of providing additional *be() methods, we should just crea=
te a new
>> type io::Endianness and use it to indicate the device endianness when re=
questing
>> the I/O resource.
>>=20
>> For instance, for your driver we could have
>>=20
>> request.iomap_exclusive_sized::<8>(Endianness::Big)?
>
> Can we please structure this in a way that LittleEndian is the default?
> Perhaps using a const generic that is defaulted, or something along these=
 lines.

Yes, little-endian should absolutely be the default. Please don't take the =
above
as specific suggestion. :)

>>=20
>> and then let the I/O backend choose the correct accessors based on this.
>>=20
>> I.e. the device is either big or little endian, hence we don't need to p=
rovide
>> both accessors at the same time.
>>=20
>> [1] https://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-c=
ore.git/log/?h=3Ddriver-core-next
>>=20

