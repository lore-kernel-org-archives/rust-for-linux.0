Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685CC13635E;
	Sat,  9 May 2026 08:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778313694; cv=none; b=LReqDzcGpJMT9HeElLwAVAPloIDVpsgMYMUAONsWBQ58+8m5V3uXYHnGz2dJ6PLzH+Q2vg8dssF/jaP6eh1Y8nZrYXeNXZAFUv1ArrYm6x9gjepShEKTvXc9Ide5OmG925hE/X/gfo1t05t4bCPq3gRY/EMryFv70SFEDFGjXjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778313694; c=relaxed/simple;
	bh=cSLbTkj+YESgotPhjPv6RdOkLMTF/V0yMsRfsJpHNk0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=tpPrKkrVO7h2RrI29sTA+E+EWh17Jpop3T3leSSgaEFK4+yXdVOoB6C7dVUbfL0d3PEtIPolKuBDGAv96v4U+LaVj/IxBav5nofj9ID//tlgkNOH6M6pUm5CjVHE8FFht0LpaRzTWK1dbUN6wmDKfwLbf3NzVDHyoroaEZ5EZ6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jcjMS2hJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jcjMS2hJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E391C2BCB2;
	Sat,  9 May 2026 08:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778313694;
	bh=cSLbTkj+YESgotPhjPv6RdOkLMTF/V0yMsRfsJpHNk0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=jcjMS2hJqvLTzOkfAZPTUaGz0b7Dkg5dt4DG5NS06Z98o8/VIjp+WUe/PvRtOggyi
	 ODdMarXnrm2Dia8TcbiIH7dWm/e0mrBEbhr/Tl4Efr4hTInwodDuADrIq7bch7xuSo
	 0IiAwX7KnlK+SY8qtklqa6ssr5L+gCgLL5uuY+fwiHz2JpMKgFl1+6gKdGMnYEbnOG
	 oqBihWqO4XZ7n1X9eIb2obssyWF5ucxXfg+c9lrYZozipf9yRG79nXSd/mJwhvi0PK
	 p8dS/tKd2AgIcbi7wxxuV5xHZFSi9fY/lcCQnEO2RmAyDfdEghR67OF/D4UHACgizp
	 qHDyerYQ0R4+A==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Tamir Duberstein <tamird@kernel.org>, Malte Wechter
 <maltewechter@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo
 <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno
 Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor
 Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Jesung Yang
 <y.j3ms.n@gmail.com>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust-analyzer: update generate_rust_analyzer to pass
 cfg to macros crate
In-Reply-To: <CAJ-ks9=Cr1Mn1EXsWqG+KE-Y2Ed0a21PMfERjNr+M1wdgNaqjw@mail.gmail.com>
References: <20260508-rust-analyzer-macro-v1-1-9122b940d003@gmail.com>
 <tZVMtGYsm0cBcaJI0F5LiCIFXdKzw0Q7P6i8r4QQD3w9qOXUtzERcMCmufStTD8eP-3QZqdVRkv4WO6RALToRg==@protonmail.internalid>
 <CAJ-ks9=Cr1Mn1EXsWqG+KE-Y2Ed0a21PMfERjNr+M1wdgNaqjw@mail.gmail.com>
Date: Sat, 09 May 2026 10:01:21 +0200
Message-ID: <87cxz56mge.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Tamir,

"Tamir Duberstein" <tamird@kernel.org> writes:

> On Fri, May 8, 2026 at 3:04=E2=80=AFAM Malte Wechter <maltewechter@gmail.=
com> wrote:
>>
>> pass kernel configurations to the macros crate to prevent rust-analyzer
>> from marking conditionally included macros as 'never included'.
>> Add the generated configurations to the macros cfg list
>> so rust-analyzer correctly hints inclusion and exclusion.
>>
>> Signed-off-by: Malte Wechter <maltewechter@gmail.com>
>
> Hi Malte, thanks for your patch. I haven't seen this issue. Could you
> please help me reproduce what you're seeing?

We are moving some of the configfs macro logic to procedural
implementations, now that we have syn. We are going to gate the macro on
CONFIG_CONFIGFS_FS. Malte noticed that rust-analyzer does not understand
the gating in the macros crate. rust-analyzer does not know that
CONFIG_CONFIGFS_FS is set, so rust-analyzer does not function at all for
our module:

--- a/rust/macros/lib.rs
+++ b/rust/macros/lib.rs
@@ -15,6 +15,8 @@
 #![cfg_attr(not(CONFIG_RUSTC_HAS_SPAN_FILE), feature(proc_macro_span))]

 mod concat_idents;
+#[cfg(CONFIG_CONFIGFS_FS)]
+mod configfs_attrs;
 mod export;

> Directionally I think this patch is incorrect because the macros crate
> is a host-side crate and generated_cfg is for target-side cfgs.

We might want to differentiate macro implementations based on kernel
configuration, or as in our case, skip compilation of certain macros
when they are not used in the kernel build.


Best regards,
Andreas Hindborg


