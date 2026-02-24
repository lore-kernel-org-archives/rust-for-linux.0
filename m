Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5A137AA9E;
	Tue, 24 Feb 2026 14:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771942844; cv=none; b=WfqHPrLhuDW6K3QLH6aBUCfGSm7v+7PYiFYzuXuEkvGiLD512v+qJmggfsu0B4Fj8z/qNzOjycTtBeKBoX/QduzpbH4WwKZougVwn+5u/g0GWbePixqxjV+G1Xn0KTGnzoF7j6cgoUuLeUMOUFfLEa4dgvAXxcSUpTi1RN4fflo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771942844; c=relaxed/simple;
	bh=6hP11Yqqq/GprRK2m8tsdirVLpoUEEz5m8g6sqgivnQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=FQiDQbXImDhsV9EgaYOD6N6PsThrodlyflwpBSR+f8F32bd/u9hsXpgcBFUKFTN5s94QPtTAEmBIsOS+b7gXl89AFifWSED+tN8FaZL+RCMXp91597bB7PuKYc8rRCRptyhWpQnfp2Q1Xve7jMxwFy3HNVUTOo7MzNH8S4hF+nM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mi2r2O0b; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mi2r2O0b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD07EC116D0;
	Tue, 24 Feb 2026 14:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771942844;
	bh=6hP11Yqqq/GprRK2m8tsdirVLpoUEEz5m8g6sqgivnQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Mi2r2O0bcVP3kNrU94OzHezKKtr810sFgXSDqUTfy1t7kGF6CA7IrNmP76HxVuW/u
	 cngKdcjQ3eki6HHwThIvpxkbpFaJ2BJUTvY7uKcknKpgTZA42piMZmD9NY5wrQNoob
	 OKeCdS/K62rMCxFt/NClkt79UTcN/A/iInwdQ1l0X5q5n20E8+Ve0V+a/+ejsGN6i5
	 CW55fYFJmX26Qo2yr1Fr+KycrSXQLKGnQFu0Eq4/7HMeRE3U68lSfDtWKHmlfI+PTT
	 CKzaBde/Ay1zJq/ZlA3y4fZ4ZvCpCg0QS/c/wLfCEpQ9u9XUHNXsqy7LiM5E3mzUmd
	 6EHAXmyuMP2pw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Tamir Duberstein
 <tamird@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor
 <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo
 <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno
 Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, Danilo
 Krummrich <dakr@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Andrew Morton
 <akpm@linux-foundation.org>, Christoph Lameter <cl@gentwo.org>, David
 Rientjes <rientjes@google.com>, Roman Gushchin <roman.gushchin@linux.dev>,
 Harry Yoo <harry.yoo@oracle.com>, Daniel Gomez <da.gomez@kernel.org>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
Subject: Re: [PATCH v3 03/12] rust: xarray: add `contains_index` method
In-Reply-To: <aY7eMIhkPJ3wXD51@google.com>
References: <20260209-xarray-entry-send-v3-3-f777c65b8ae2@kernel.org>
 <q43rzzvpfh6ke74eyn3nypiek2ihaq6nat552asiobqge4vxmn@knwkb5dexnga>
 <87fr77viat.fsf@t14s.mail-host-address-is-not-set>
 <fU1FEYt6-SY0KlyJy4VClCr5j6P4d5-wukzc_9TkSDSBuQNlY26xyOIprMbHEVMv-H-nrAJ1iN_9tcfIXEI1iw==@protonmail.internalid>
 <gta2wjt4tkcvyu7g56gqyipiigbmbk2ca3biqzmxc2npch3rk7@ccwzwgnk7mcz>
 <87y0kytggx.fsf@kernel.org> <87v7g2tesf.fsf@kernel.org>
 <_ZaFqe4HzW4GSDQTrXKDgkSCr7L9bxUh-h5QPqVlMUHSvE0oRFuZJOPi0JItf3VJXHmaX4PA4QWAGBeG73cJYw==@protonmail.internalid>
 <CAH5fLgjfSWfhUkmG6_ugue6Wp5LKtkEFJofWViJSNByq3sO2Sg@mail.gmail.com>
 <87seb6t9t7.fsf@kernel.org> <aY7eMIhkPJ3wXD51@google.com>
Date: Tue, 24 Feb 2026 15:20:29 +0100
Message-ID: <87pl5u1avm.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Alice Ryhl <aliceryhl@google.com> writes:

> On Thu, Feb 12, 2026 at 01:39:48PM +0100, Andreas Hindborg wrote:
>> "Alice Ryhl" <aliceryhl@google.com> writes:
>>=20
>> > On Thu, Feb 12, 2026 at 11:52=E2=80=AFAM Andreas Hindborg <a.hindborg@=
kernel.org> wrote:
>> >>
>> >> Andreas Hindborg <a.hindborg@kernel.org> writes:
>> >>
>> >> > As far as I understand, this is a borrow checker limitation. It is =
easy
>> >> > for us to look at this code and decide that the borrow on line 51 w=
ill
>> >> > never alias with the borrow on line 49.
>> >>
>> >> I did a bit of googling, and this seems to be a well known issue with
>> >> the current implementation of lifetime analysis in the rust compiler.
>> >> Apparently this kind of code used to be OK [1] but the Rust devs deci=
ded
>> >> to remove the code that allowed this, because it was causing excessive
>> >> compilation times [2]. The upside is that this is solved by the new
>> >> lifetime analysis implementation called "Polonius" and it is the
>> >> intention to replace the existing implementation with Polonius at some
>> >> point [3].
>> >
>> > I believe the standard fix for this issue is to provide an entry api
>> > similar to HashMap::entry(). See the rbtree for an example, as it
>> > already provides such API.
>>=20
>> The example above [1] is using the BTreeMap entry API to produce the
>> issue. Are the BTreeMap and HashMap entry APIs significantly different,
>> or is there something else I missed?
>>=20
>> Best regards,
>> Andreas Hindborg
>>=20
>> [1] https://lore.kernel.org/r/87y0kytggx.fsf@kernel.org
>
> Hrm, tricky. I think it would work if the entry type had an into_map() th=
at
> consumes the entry and returns a &mut to the original map.
>
>   fn transaction_impl1<'a>(maps: &'a mut Maps, key: u32) -> &'a mut u32 {
>       match maps.a.entry(key) {
>           Entry::Occupied(o) =3D> o.into_mut()
>           Entry::Vacant(v) =3D> {
>               let map_a =3D v.into_map();
>               let value =3D map_a.first_entry().expect("Not empty").remov=
e();
>               maps.b.entry(key).or_insert(value)
>           }
>       }
>   }

I see. In my use case, this line

  map_a.first_entry().expect("Not empty").remove();

is not open coded. Rather, it is in a function on `Maps`:

  impl<'a> Maps<'a> {
      fn foo(&mut self) -> u32 {
          self.a.first_entry().expect("Not empty").remove()
      }
  }

  fn transaction_impl1<'a>(maps: &'a mut Maps, key: u32) -> &'a mut u32 {
      match maps.a.entry(key) {
          Entry::Occupied(o) =3D> o.into_mut(),
          Entry::Vacant(v) =3D> {
              let value =3D maps.foo();
              maps.foo();
              maps.b.entry(key).or_insert(value)
          }
      }
  }

In the actual code, `Maps::foo` is not a small short function, which is
why I extracted it into a function.

I think I could make this work if I just put everything in one big
function, but that does not seem like the right solution.

Am I holding it wrong here, or is this just the way it is?

My `transaction_imp1` is `get_or_alloc_cache_page` [1] and my `foo` is
`extract_cache_page` [2] if you want to have a look.


Best regards,
Andreas Hindborg


[1] https://git.kernel.org/pub/scm/linux/kernel/git/a.hindborg/linux.git/tr=
ee/drivers/block/rnull/disk_storage.rs?h=3Drnull-v6.19-rc5#n209
[2] https://git.kernel.org/pub/scm/linux/kernel/git/a.hindborg/linux.git/tr=
ee/drivers/block/rnull/disk_storage.rs?h=3Drnull-v6.19-rc5#n148

