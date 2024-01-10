Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48EE632C80
	for <rust-for-linux@vger.kernel.org>; Wed, 10 Jan 2024 09:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="FMDmvclM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1704879955; x=1705139155;
	bh=m37CgWVd0919lqVq8UbeVhmrp4RCUxltBdgLKQagUoY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=FMDmvclMRSu2HJjFX9T73QPFzGPhzHTvEZJvCIud5jOUpH/KvpKrbBCGCjL/RR1Hx
	 l0EWnvhOKT6YXXIXsn0aemtzbKBhASy4wpyALMrtW/3GdVapfcu3+Pb4vK6UdXxBCQ
	 2LbwQGEPQrsb4Fke5noXqGIz3ZYSHFOOcBdcSQoUfWhhIopkoQGfOTTOJQYDViJtPL
	 WDQlYqIR34aHbQOKgarXnYWhp5T9eJ7HpSDz1Ufsj8hD/ehU5HvaKwOe5HGkIfRCzL
	 Qbk2gvGhrbr4V96YqPARHo2cxRVzIDw9hTfJlURD2mvqLzX51IjI27Sy/uaxNXj3HZ
	 V5YpcZSauoZxg==
Date: Wed, 10 Jan 2024 09:45:27 +0000
To: "Andreas Hindborg (Samsung)" <nmi@metaspace.dk>, Wedson Almeida Filho <wedsonaf@gmail.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Matthew Wilcox <willy@infradead.org>, Kent Overstreet <kent.overstreet@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-fsdevel@vger.kernel.org, rust-for-linux@vger.kernel.org, Wedson Almeida Filho <walmeida@microsoft.com>
Subject: Re: [RFC PATCH 05/19] rust: fs: introduce `INode<T>`
Message-ID: <0ff0109e-3d1f-4aeb-97fb-6f746791fafd@proton.me>
In-Reply-To: <87sf3e5v55.fsf@metaspace.dk>
References: <20231018122518.128049-1-wedsonaf@gmail.com> <20231018122518.128049-6-wedsonaf@gmail.com> <87sf3e5v55.fsf@metaspace.dk>
Feedback-ID: 71780778:user:proton
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 03.01.24 13:54, Andreas Hindborg (Samsung) wrote:
> Wedson Almeida Filho <wedsonaf@gmail.com> writes:
>> +    /// Returns the super-block that owns the inode.
>> +    pub fn super_block(&self) -> &SuperBlock<T> {
>> +        // SAFETY: `i_sb` is immutable, and `self` is guaranteed to be =
valid by the existence of a
>> +        // shared reference (&self) to it.
>> +        unsafe { &*(*self.0.get()).i_sb.cast() }
>> +    }
>=20
> I think the safety comment should talk about the pointee rather than the
> pointer? "The pointee of `i_sb` is immutable, and ..."

I think in this case it would be a very good idea to just split
the `unsafe` block into two parts. That would solve the issue
of "what does this safety comment justify?".

--=20
Cheers,
Benno

