Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C013B52EA;
	Thu,  8 Jan 2026 09:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767865102; cv=none; b=sci9hV6dpT5DdyjlgYGxYsOPP0iTY230hIe32Fg1/KoenSAU7i64Bma/X0ejxu6Sj6IdTiDg2aj3h2QzRwAv/0AQJWJ4olm6Uk66i7nQ4NgwYEv4TJwn5B060NFyNiVPvG/lrKzYdXqLXaAJ/0k3JZLlYFP0AJPI9NQenYc883Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767865102; c=relaxed/simple;
	bh=H4w3x6JePkscsnP4gPGcjSo1BpjKM8UTiz+a9qfLSrg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=CI1I+GUxfpj6FfD+CcKTseay4X2TjId6Z3k0TP1M9yuRTfU1U+g53jUAysLXTH6eCwVXP1/4TRerce9p2T4Ztsb8GXqeOK2K1FmZ+PWdSTqs48XTVHd0ELTuc4k9+ws4F/ymtNP2Tryz01iQLtX/BpHgmmwhvE17eGvfWrI05Qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GxOsGjRC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GxOsGjRC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A4C9C16AAE;
	Thu,  8 Jan 2026 09:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767865100;
	bh=H4w3x6JePkscsnP4gPGcjSo1BpjKM8UTiz+a9qfLSrg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=GxOsGjRCUhn6e7Jg1mbVXMqyf2SenmVJk9/k7uDpJVsbeZ4O4DRRn6/EFWBcePdo6
	 SsplutUjJV0DFNIPEJWhqAX+wsqERcGcv/C8zYeAljo0UhEiahFZ+AHLTBNrasLecW
	 CTtTKbYFlyC6nX/WtBfTKLqcD1lxlNfzO8/jJAgGxBagLnG/F6w6IwfIuxnX6B+cGp
	 GuD2UtcfpjRz+PMax/yvOnTEvtNDrHLhQZCQczN5nSq0h5gH1DorLKdhNPCmHrT45a
	 DTJooVmDzxdVwbPYJRECcbAiTM+t2pdjdlTzmQeZXbmcPHCuvWcsnuQh2MSGHOTS0Y
	 OTUyYf14rBszg==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn?= Roy
 Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Alice
 Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo
 Krummrich <dakr@kernel.org>, Daniel Gomez <da.gomez@kernel.org>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/10] rust: xarray: add `contains_index` method
In-Reply-To: <CAJ-ks9kYk7cuQFOK89OwUx+k8p+_kANjB12rZLO+dzfSd=BpdQ@mail.gmail.com>
References: <20251203-xarray-entry-send-v1-0-9e5ffd5e3cf0@kernel.org>
 <20251203-xarray-entry-send-v1-3-9e5ffd5e3cf0@kernel.org>
 <CAJ-ks9mqwaWMc0MTGOk+rKSM8W8spRmwiLGCkEjcSvF+d7QW7g@mail.gmail.com>
 <87jyxtgtlc.fsf@t14s.mail-host-address-is-not-set>
 <CAJ-ks9kYk7cuQFOK89OwUx+k8p+_kANjB12rZLO+dzfSd=BpdQ@mail.gmail.com>
Date: Thu, 08 Jan 2026 10:29:43 +0100
Message-ID: <87344gh2pk.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Tamir Duberstein <tamird@gmail.com> writes:

> On Wed, Jan 7, 2026 at 1:34=E2=80=AFPM Andreas Hindborg <a.hindborg@kerne=
l.org> wrote:
>>
>> Tamir Duberstein <tamird@gmail.com> writes:
>>
>> > On Wed, Dec 3, 2025 at 5:27=E2=80=AFPM Andreas Hindborg <a.hindborg@ke=
rnel.org> wrote:
>> >>
>> >> Add a convenience method `contains_index` to check whether an element
>> >> exists at a given index in the XArray. This method provides a more
>> >> ergonomic API compared to calling `get` and checking for `Some`.
>> >
>> > It isn't clear when you'd want this API, and neither this nor the
>> > example are particularly motivating.
>>
>> I added this when I had a line reading `if xa.get(index).is_none()
>> {...}`. I think it reads better as `if !xa.contains_index(index) {...}`.
>
> What was the code surrounding it?
>
>> Do you have an idea of how to improve the motivational factor of the
>> example? Writing motivating examples is not my top skill.
>
> IMO writing a better example is not the issue; rather it would be good
> to understand why you need it. In my experience `Option::is_none` is a
> smell, but hard to say without seeing the surrounding code.

    fn get_cache_page(&mut self, sector: u64) -> Result<&mut NullBlockPage>=
 {
        let index =3D Self::to_index(sector);

        if self.cache_guard.contains_index(index) {
            Ok(self.cache_guard.get_mut(index).expect("Index is present"))
        } else {
            let page =3D if self.disk_storage.cache_size_used.load(ordering=
::Relaxed)
                < self.disk_storage.cache_size
            {
                self.hw_data_guard
                    .page
                    .take()
                    .expect("Expected to have a page available")
            } else {
                self.extract_cache_page()?
            };
            Ok(self
                .cache_guard
                .insert_entry(index, page, Some(&mut self.hw_data_guard.pre=
load))
                .expect("Should be able to insert")
                .into_mut())
        }
    }

For lifetime reasons, I cannot borrow `self` in the taken arm.


Best regards,
Andreas Hindborg


