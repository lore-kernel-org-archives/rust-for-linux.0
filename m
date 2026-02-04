Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386CD2D5926;
	Wed,  4 Feb 2026 15:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770218335; cv=none; b=LTx2nU7Wc7piG2IoDQReyjLyZ5/zIzCT2dBRnedLo+0bpGmKK0OdHIsaWhcnGQlxZ0H9kVYkERjPkVEOg6b1f+Bs+s7gIiRmfijtUz3WCSF9puir5z3EAlgrEyJYrc7g/ZX3AHcgRgjPgRKM3Kb+FLat6V2qTxxWnevlTU/QPpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770218335; c=relaxed/simple;
	bh=R/vYVRpiIAu9yQjINq8nY1wv3oc/VE2zCfT+3Ijz/40=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=SJYfbdqKHv/9yoWgOtfepc+GrU1a/iUWos7zw63jufGK5ZTK9isjxONTPT81gGW5XDZd2cJ5p57SxSt7T56G/tPc4yYJKUOfxUZyonX0hJoDBMsyb7Qf3P4jzPXAJ7pbVCblZPVhbgqBenJZB18JU2hzwWVwBxtQmXBlg/5/Bk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lP9jjWuk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lP9jjWuk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2CB0C4CEF7;
	Wed,  4 Feb 2026 15:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770218334;
	bh=R/vYVRpiIAu9yQjINq8nY1wv3oc/VE2zCfT+3Ijz/40=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=lP9jjWukmyB7EFdcetvQyxJXXhPXHKFrHML61W5B4WEE2icZWtPcdHewuK9ibiQSH
	 baHVldFuhplxp1PjWrkUvgBUAqF2CYkBFeVGLnNwUwkiGBAvquhy6eQOJlFnEK/OG6
	 +kbH9QMJq5wOxeUTLb8QBIRZYZUXssU3nJXQGW/oQwWwDjZpXkZZDLLlM7aTjaotLh
	 hQI8JrMDt+oQPfUg+LwhFUQMEcNewdPw4h6R1vnHzQ03FRwAxL0GI+H0bbsOW+WiiB
	 /IiKPTahxsOHwXboK2DPHJAjYjwXBfN72iHP/Tu+OF5yPCmds+AKnE1m6BIdY6O3d8
	 IJbrU76l0lcww==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Feb 2026 16:18:47 +0100
Message-Id: <DG6A0WRA0JZC.SPDT9WEXF92K@kernel.org>
Subject: Re: [PATCH v2 1/4] rust: io: Add big-endian read and write
 functions
Cc: <rust-for-linux@vger.kernel.org>, "Madhavan Srinivasan"
 <maddy@linux.ibm.com>, "Michael Ellerman" <mpe@ellerman.id.au>, "Nicholas
 Piggin" <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)"
 <chleroy@kernel.org>, "Srinivas Kandagatla" <srini@kernel.org>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Ard Biesheuvel" <ardb@kernel.org>, "Martin
 K. Petersen" <martin.petersen@oracle.com>, "Eric Biggers"
 <ebiggers@google.com>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Lyude Paul" <lyude@redhat.com>, "Asahi Lina" <lina+kernel@asahilina.net>,
 "Viresh Kumar" <viresh.kumar@linaro.org>, "Lorenzo Stoakes"
 <lorenzo.stoakes@oracle.com>, "Tamir Duberstein" <tamird@kernel.org>,
 "FUJITA Tomonori" <fujita.tomonori@gmail.com>,
 <linuxppc-dev@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
 <officialTechflashYT@gmail.com>, "Ash Logan" <ash@heyquark.com>, "Roberto
 Van Eeden" <rw-r-r-0644@protonmail.com>,
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: "Link Mauve" <linkmauve@linkmauve.fr>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260204040505.8447-1-linkmauve@linkmauve.fr>
 <20260204040505.8447-2-linkmauve@linkmauve.fr>
In-Reply-To: <20260204040505.8447-2-linkmauve@linkmauve.fr>

On Wed Feb 4, 2026 at 5:04 AM CET, Link Mauve wrote:
> Another option would be to call u32::swap_bytes() on the data being
> read/written, but these helpers make the Rust code as ergonomic as the C
> code.
>
> Signed-off-by: Link Mauve <linkmauve@linkmauve.fr>

The I/O stuff recently changed quite significantly, please have a look at t=
he
driver-core-next branch [1] in the driver-core tree.

Also, instead of providing additional *be() methods, we should just create =
a new
type io::Endianness and use it to indicate the device endianness when reque=
sting
the I/O resource.

For instance, for your driver we could have

	request.iomap_exclusive_sized::<8>(Endianness::Big)?

and then let the I/O backend choose the correct accessors based on this.

I.e. the device is either big or little endian, hence we don't need to prov=
ide
both accessors at the same time.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core=
.git/log/?h=3Ddriver-core-next
