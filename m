Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9B92264DB
	for <rust-for-linux@vger.kernel.org>; Tue,  5 Aug 2025 12:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754398411; cv=none; b=GfM6+1q9SdO3ymmCzDiVpTcguvjneZIm3YcGbE+/Z0vTvHJ5qGPpuVSs3kaIqLLvCF6i9HzTAS/DcO8pwbPZBPd4VGxKODGwOFiDSesxViKEziWnj/baHNhJfLpRxDft+Dm8BEQN+UI9TIz8yLRvaXEJfP/cWnosykqc9uV44xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754398411; c=relaxed/simple;
	bh=osgzXzz6RaoaU/kvCWUo2vwYN3DpfVNQphG23h7p0zk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=A7PU1uqOt44IPkJQfSKYNizAIcbubHH/o2p+38pAu7T1mJ7nO3vOuEi0KsFQjwg+7+PUmh9YNMb1/kcMI7ap6I+XKudoUVHw9jt7o+phuXLCeMFpkwVrlZwi3pTc15HHeQSjji/HE9DWrGgOEhI5qRkytmgAjxtKfsfOUavm7ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AXh2Kkrx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AXh2Kkrx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B62BC4CEF0;
	Tue,  5 Aug 2025 12:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754398410;
	bh=osgzXzz6RaoaU/kvCWUo2vwYN3DpfVNQphG23h7p0zk=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
	b=AXh2KkrxuJ2q8aEVS6sVBCtTFJpFFPln3CUbMSLUtjza6dG3q3JRSzlET7dp4zjHw
	 5J90RiD//gFzqP06skxcAwEoqiJjsWuK+dkfXccNazS+x6B+xaOvvZe6D5XTsxcLHp
	 ogLwL+JlY0GW/Nr767BR1+ViBZuvS5Hbv1VUDSToBSLzIMMKa1dLL/QGQixeUceyaT
	 8eDNhqABke0Nw7MCjLJ8zhxU79LLTx43f2HN65ezw3CcKySlTk/ev6AXUe+uETndcO
	 iHyE/U8hcwSRqGLEr1ceU+1JQBO9WhfEhZLYpbLjFG+sA19eWI6W0E4tdb4++f8hff
	 OzoOfOQWILbxg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 05 Aug 2025 14:53:26 +0200
Message-Id: <DBUIBXEOODEH.R2NYIGUDBZC7@kernel.org>
Cc: <ojeda@kernel.org>, <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>,
 <gary@garyguo.net>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
 <a.hindborg@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>,
 <abdiel.janulgue@gmail.com>, <acourbot@nvidia.com>,
 <rust-for-linux@vger.kernel.org>
To: "Daniel Almeida" <daniel.almeida@collabora.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH] rust: page: implement BorrowedPage
References: <20250804195023.150399-1-dakr@kernel.org>
 <731A34A7-92AD-47EA-A17A-C25FA94A5144@collabora.com>
In-Reply-To: <731A34A7-92AD-47EA-A17A-C25FA94A5144@collabora.com>

On Tue Aug 5, 2025 at 2:30 PM CEST, Daniel Almeida wrote:
> Hi Danilo,
>
>> On 4 Aug 2025, at 16:50, Danilo Krummrich <dakr@kernel.org> wrote:
>>=20
>> Currently, a Page always owns the underlying struct page.
>>=20
>> However, sometimes a struct page may be owned by some other entity, e.g.
>> a vmalloc allocation.
>>=20
>> Hence, introduce BorrowedPage to support such cases, until the Ownable
>> solution lands.
>
> I guess it=E2=80=99s a good idea to expand this part somewhat. Taken as i=
t is,
> there is no way to know what =E2=80=9Cthe Ownable solution=E2=80=9D is.

What do you suggest?

I can link where the type has been proposed by Boqun [1].

[1] https://lore.kernel.org/rust-for-linux/ZnCzLIly3DRK2eab@boqun-archlinux=
/

>> This is required by the scatterlist abstractions.
>>=20
>> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
>> ---
>> rust/bindings/bindings_helper.h |  1 +
>> rust/kernel/page.rs             | 83 ++++++++++++++++++++++++++++++++-
>> 2 files changed, 83 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_he=
lper.h
>> index 84d60635e8a9..0e140e07758b 100644
>> --- a/rust/bindings/bindings_helper.h
>> +++ b/rust/bindings/bindings_helper.h
>> @@ -57,6 +57,7 @@
>> #include <linux/jiffies.h>
>> #include <linux/jump_label.h>
>> #include <linux/mdio.h>
>> +#include <linux/mm.h>
>> #include <linux/miscdevice.h>
>> #include <linux/of_device.h>
>> #include <linux/pci.h>
>> diff --git a/rust/kernel/page.rs b/rust/kernel/page.rs
>> index 7c1b17246ed5..bea7f0ab91f4 100644
>> --- a/rust/kernel/page.rs
>> +++ b/rust/kernel/page.rs
>> @@ -9,7 +9,12 @@
>>     error::Result,
>>     uaccess::UserSliceReader,
>> };
>> -use core::ptr::{self, NonNull};
>> +use core::{
>> +    marker::PhantomData,
>> +    mem::ManuallyDrop,
>> +    ops::Deref,
>> +    ptr::{self, NonNull},
>> +};
>>=20
>> /// A bitwise shift for the page size.
>> pub const PAGE_SHIFT: usize =3D bindings::PAGE_SHIFT as usize;
>> @@ -30,6 +35,82 @@ pub const fn page_align(addr: usize) -> usize {
>>     (addr + (PAGE_SIZE - 1)) & PAGE_MASK
>> }
>>=20
>> +/// Representation of a non-owning reference to a [`Page`].
>> +///
>> +/// This type provides a borrowed version of a [`Page`] that is owned b=
y some other entity, e.g. a
>> +/// [`Vmalloc`] allocation such as [`VBox`].
>> +///
>> +/// # Example
>> +///
>> +/// ```
>> +/// # use kernel::{bindings, prelude::*};
>> +/// use kernel::page::{BorrowedPage, Page, PAGE_SIZE};
>> +/// # use core::ptr;
>> +/// # use core::ptr::NonNull;
>> +///
>> +/// trait PageOwner {
>
> What is this trait for? Perhaps this assumes some previous discussion tha=
t is
> not in the patch itself?

It's just example code to show how a BorrowedPage may be obtained from some=
thing
that owns a page, i.e. a PageOwner.

However, I'm actually working on a trait similar to this example one as wel=
l.
