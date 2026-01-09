Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 013E03382D5;
	Fri,  9 Jan 2026 10:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767955131; cv=none; b=dWtn0FRF5A5i4MYAbY+gpUhmm5fKvdyprOmXKICWYkYH7tAMxc0zEBWPojSu2420Exe9RRCZJyrz2i7QkTLIt8q+yRl4a8KuUn/KANhCSChjR3/g466NLH0FIK+48S5O+GjxO5X0eGqz2Nf5R87HKYTi0JuX7MvcDh9OuyI62Es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767955131; c=relaxed/simple;
	bh=5dq2LQhb/35Usinfdh4hIvlLIWF6On28MY9N6kRNYCs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=sQA9BFfcqBpMXg1m8bgMab3s3uuz+Ht5nkFzvRjFwvNAJZ5L6qGjg0DBWoiGiURYcse3inLBoI+MVR/gUWs7XlaJe21SVoluUgK/O0dT72bUreRSq1d1+ICAZ9eAZHmSOVAZdBDsdYfigwhkvqpAgx5dWBRkl1FfnTEPUsBc53Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IeEMa3qJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IeEMa3qJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A170DC19421;
	Fri,  9 Jan 2026 10:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767955130;
	bh=5dq2LQhb/35Usinfdh4hIvlLIWF6On28MY9N6kRNYCs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=IeEMa3qJDHxPXBCz684e/vlWlMbrhJmOdaNczvrA4vJkF95Tg6iXxWysHnaNIg33Z
	 DHlv4sa228H/ri3Xi5uQ+eFnNtaMar5Ii5bLMUKYKW92tKI5H0mOH3I4+6Mqwg/cGo
	 jiZRqkmIHjhrU/G6yZEwiisiXx+SPtLA3LJnsxs/1PhESRzbJ4q48kuSDrTgoisNnG
	 CrSQiTf6nwkz/1FG/oFmvAOIqQB5AVKuLfZKOT0eGrLKQrqiqlUUtg1X6qU+22H8Hr
	 +1UHH12BOTqPmvzQZJQhlQuuwWj/wTaptK6I3b1AbRLlU+kmCrH6bad087I/Vh0oB0
	 g5anYScs21dnA==
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
In-Reply-To: <CAJ-ks9=JJ6S6U-Bq0WC1PfJ0P9G3PvugfDdE2q9Q516M-QpsoA@mail.gmail.com>
References: <20251203-xarray-entry-send-v1-0-9e5ffd5e3cf0@kernel.org>
 <20251203-xarray-entry-send-v1-3-9e5ffd5e3cf0@kernel.org>
 <CAJ-ks9mqwaWMc0MTGOk+rKSM8W8spRmwiLGCkEjcSvF+d7QW7g@mail.gmail.com>
 <87jyxtgtlc.fsf@t14s.mail-host-address-is-not-set>
 <CAJ-ks9kYk7cuQFOK89OwUx+k8p+_kANjB12rZLO+dzfSd=BpdQ@mail.gmail.com>
 <87344gh2pk.fsf@t14s.mail-host-address-is-not-set>
 <2PUnbrv1SBqe3PHKeFqFI7zge1N89qpwH_FF_pXszbaA9-ocBueRJHb0KcuW9EyPNiZFCaCc1vgmTjXP_u_oPQ==@protonmail.internalid>
 <CAJ-ks9=JJ6S6U-Bq0WC1PfJ0P9G3PvugfDdE2q9Q516M-QpsoA@mail.gmail.com>
Date: Fri, 09 Jan 2026 11:38:28 +0100
Message-ID: <87o6n3f4uz.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Tamir Duberstein" <tamird@gmail.com> writes:

> On Thu, Jan 8, 2026 at 4:38=E2=80=AFAM Andreas Hindborg <a.hindborg@kerne=
l.org> wrote:
>>
>> Tamir Duberstein <tamird@gmail.com> writes:
>>
>> > On Wed, Jan 7, 2026 at 1:34=E2=80=AFPM Andreas Hindborg <a.hindborg@ke=
rnel.org> wrote:
>> >>
>> >> Tamir Duberstein <tamird@gmail.com> writes:
>> >>
>> >> > On Wed, Dec 3, 2025 at 5:27=E2=80=AFPM Andreas Hindborg <a.hindborg=
@kernel.org> wrote:
>> >> >>
>> >> >> Add a convenience method `contains_index` to check whether an elem=
ent
>> >> >> exists at a given index in the XArray. This method provides a more
>> >> >> ergonomic API compared to calling `get` and checking for `Some`.
>> >> >
>> >> > It isn't clear when you'd want this API, and neither this nor the
>> >> > example are particularly motivating.
>> >>
>> >> I added this when I had a line reading `if xa.get(index).is_none()
>> >> {...}`. I think it reads better as `if !xa.contains_index(index) {...=
}`.
>> >
>> > What was the code surrounding it?
>> >
>> >> Do you have an idea of how to improve the motivational factor of the
>> >> example? Writing motivating examples is not my top skill.
>> >
>> > IMO writing a better example is not the issue; rather it would be good
>> > to understand why you need it. In my experience `Option::is_none` is a
>> > smell, but hard to say without seeing the surrounding code.
>>
>>     fn get_cache_page(&mut self, sector: u64) -> Result<&mut NullBlockPa=
ge> {
>>         let index =3D Self::to_index(sector);
>>
>>         if self.cache_guard.contains_index(index) {
>>             Ok(self.cache_guard.get_mut(index).expect("Index is present"=
))
>>         } else {
>>             let page =3D if self.disk_storage.cache_size_used.load(order=
ing::Relaxed)
>>                 < self.disk_storage.cache_size
>>             {
>>                 self.hw_data_guard
>>                     .page
>>                     .take()
>>                     .expect("Expected to have a page available")
>>             } else {
>>                 self.extract_cache_page()?
>>             };
>>             Ok(self
>>                 .cache_guard
>>                 .insert_entry(index, page, Some(&mut self.hw_data_guard.=
preload))
>>                 .expect("Should be able to insert")
>>                 .into_mut())
>>         }
>>     }
>>
>> For lifetime reasons, I cannot borrow `self` in the taken arm.
>
> That's surprising. Couldn't you destructure Self so that all the
> references derive from the single mutable reference &mut self?

I don't think so, because I still need `&mut self` around to do the call
to `extract_cache_page`.


Best regards,
Andreas Hindborg



