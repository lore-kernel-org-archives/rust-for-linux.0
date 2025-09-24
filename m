Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80822182B4
	for <rust-for-linux@vger.kernel.org>; Wed, 24 Sep 2025 17:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758733703; cv=none; b=YDaSIU/j+2cWEtkRdpk/S7W27er2CjO8vN2abxG/mr/WlzZc6udsNsjoVR2rteMs98Fiwj2B268/qq8B5CuB9p/jnH2bjmlWG7A/HKUu+tBRipUZmdCVfWPy9HLMHRwXNYEXqsi6uVOt4c2KYNd/addLHVQKhY2z7eePm+ioYXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758733703; c=relaxed/simple;
	bh=Q164XZOGgOUgswuroiD64gMeFMiSLuZOheY970LwxUQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=LH2LDZejdulc5Ycoe90LBevANP74Wgxuq92G1vzo9qVNSraNbRq3vfU/u1XXCp2o65UekWYEcl8amyOFPKbuWR7eEXO+X9FsMlwI/rZohFla1sFlPWdmaLl7UMzdykENl6VzsOhe/QasokRPXNba3zfBQHXjEdsXgNS/KZxz5Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a6Xl+b7z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a6Xl+b7z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 831ADC4CEE7;
	Wed, 24 Sep 2025 17:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758733702;
	bh=Q164XZOGgOUgswuroiD64gMeFMiSLuZOheY970LwxUQ=;
	h=Date:To:Cc:Subject:From:References:In-Reply-To:From;
	b=a6Xl+b7zzR9pWpmp/xzu3jPwMEC1bMPjoTToFBw3xShtRNZdlRvCdjMJ3sg1o6pMM
	 yA873Alfhr/wJcF/uThg8biEtuyk3b0buYtanKZO+pESaBVdM4RDHDf8SKJpPNXOye
	 r8cvUmhJkCgnPz0/aKVUHQfzbCfJxWY/gXxHitogxnLKMkgSF9t0k9rrrhdzd8Yymp
	 ufk0Z+uILJeu8ngbtjdBwMKSIeto/bCr16XUOxrNsLH3EEWlClqksZXOLY9YVK6SCa
	 e40fAadIv3ZIJRwacu78EBgWsFOJzMHLyaHyuUX56qaeOQ05l2SQU7obcrbJFxe1iV
	 A1/DBWqQkqmQg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 24 Sep 2025 19:08:15 +0200
Message-Id: <DD1729TUYX6N.39VDLKERV7YVN@kernel.org>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "Trevor Chan"
 <trev@trevrosa.dev>
Cc: <alex.gaynor@gmail.com>, <ojeda@kernel.org>,
 <gregkh@linuxfoundation.org>, <rafael@kernel.org>, <dakr@kernel.org>,
 <airlied@gmail.com>, <simona@ffwll.ch>, <aliceryhl@google.com>,
 <vireshk@kernel.org>, <nm@ti.com>, <sboyd@kernel.org>,
 <viro@zeniv.linux.org.uk>, <brauner@kernel.org>, <boqun.feng@gmail.com>,
 <gary@garyguo.net>, <bjorn3_gh@protonmail.com>, <a.hindborg@kernel.org>,
 <tmgross@umich.edu>, <rust-for-linux@vger.kernel.org>,
 <david.m.ertman@intel.com>, <ira.weiny@intel.com>, <leon@kernel.org>,
 <lorenzo.stoakes@oracle.com>, <Liam.Howlett@oracle.com>,
 <bhelgaas@google.com>, <kwilczynski@kernel.org>, <jack@suse.cz>
Subject: Re: [PATCH v3] rust: aref: make `AlwaysRefCounted::inc_ref` an
 associated function
From: "Benno Lossin" <lossin@kernel.org>
X-Mailer: aerc 0.21.0
References: <20250924052442.9259-1-trev@trevrosa.dev>
 <CANiq72nrn55Zz7wzwVpiNT9=kF1jJXDMEkhOfhAtKjgHMtjr=A@mail.gmail.com>
In-Reply-To: <CANiq72nrn55Zz7wzwVpiNT9=kF1jJXDMEkhOfhAtKjgHMtjr=A@mail.gmail.com>

On Wed Sep 24, 2025 at 10:31 AM CEST, Miguel Ojeda wrote:
> On Wed, Sep 24, 2025 at 7:24=E2=80=AFAM Trevor Chan <trev@trevrosa.dev> w=
rote:
>>
>>  rust/kernel/auxiliary.rs        |  4 ++--
>>  rust/kernel/block/mq/request.rs |  4 ++--
>>  rust/kernel/cred.rs             |  4 ++--
>>  rust/kernel/device.rs           |  4 ++--
>>  rust/kernel/device/property.rs  |  4 ++--
>>  rust/kernel/drm/device.rs       |  4 ++--
>>  rust/kernel/drm/gem/mod.rs      |  4 ++--
>>  rust/kernel/fs/file.rs          |  8 ++++----
>>  rust/kernel/mm.rs               |  8 ++++----
>>  rust/kernel/mm/mmput_async.rs   |  4 ++--
>>  rust/kernel/opp.rs              |  4 ++--
>>  rust/kernel/pci.rs              |  4 ++--
>>  rust/kernel/pid_namespace.rs    |  4 ++--
>>  rust/kernel/platform.rs         |  4 ++--
>>  rust/kernel/task.rs             |  4 ++--
>
> Acked-by's from maintainers appreciated!
>
>> +    /// This function should not be called lightly.
>
> Can we give a reason here, please?

I think we should change "lightly" to "accidentally". My motivation for
this was that a type might declare their own `inc_ref` function & it
shouldn't be confused with the one from `AlwaysRefCounted`. So it should
be a conscious action to increment the refcount manually (of course
cloning the ARef etc is fine).

---
Cheers,
Benno
