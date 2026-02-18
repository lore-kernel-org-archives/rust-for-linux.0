Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9252741B5;
	Wed, 18 Feb 2026 08:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771404820; cv=none; b=mGXnSxkIO7KA+1at1Q6alXvqLL3hKrUtdTh6majPRdlN2wnrp7Q7B3ENx67dEF9LVPLryCVeuahezeuKB5fiy0mdS4VFNijLvlD2DvlqnQV41Uzo6J/h105Kxn2AnJyttamAFLS9xFfR9ASMsLlVJVicgvF4rovJJvVkY7OLLL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771404820; c=relaxed/simple;
	bh=h8tnxqAZN5STQp4YFIacaYVYl33v6/XGGMUZhgpbLK0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ckCTUfje/Nj10JbwjPFt6f2W3WiChCvbZ2H1gSNWT84tcrfl+liyVDzWPy4cB3jvNU6QpOLlScGArsC0FYxPlrFXEkAF6285vNknMF8yD7ZkH7t8pTKoFhlyM+SuwpUzbD5mkzPqbQ6dWWPx5t3BEW6JsJ12mjSYXi/eUNNn77E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=p/c6MtAi; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="p/c6MtAi"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=rAlZyMlEkwV4M1809AS+1dB0r82ddfEQ5DHlS5PW2RQ=; b=p/c6MtAiG/lOf0ICRFINSX12Ky
	KuW2LImUZx28lDB5aVM5gVMN3ugNTPOdisLtuzNUrNqmFreDEk0splkkfaVdUhQ8o6PWVq0rot5YM
	awSIfMcj4suNpbxZ6SLa/1WCeGA1bQrA5EcgU8gSZzMXyaqQgJJk8pgF2jo7ob7EKgBNy83h4VRUk
	hR7+o3S0z6qtnVU2Ikt76dvld60lx0ArsTEZ8GWimHmMivTGyKRHD/Nhmbtq4BzX1Y+hCc104hzNl
	RxDtCNiGE5InWDgrpuAzfJbTNi7AxG4xcuCDEivt5RukrAVuEm7bnutd/XJzQxxZ83E8Wp+FG5AeF
	jF9DuL0A==;
Received: from 2001-1c00-8d85-5700-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d85:5700:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsdJI-0000000H6cT-47oi;
	Wed, 18 Feb 2026 08:53:29 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 79DBE300B40; Wed, 18 Feb 2026 09:53:27 +0100 (CET)
Date: Wed, 18 Feb 2026 09:53:27 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Boqun Feng <boqun@kernel.org>
Cc: Will Deacon <will@kernel.org>, Gary Guo <gary@garyguo.net>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, linux-mm@kvack.org,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] rust: page: add byte-wise atomic memory copy methods
Message-ID: <20260218085327.GC2995752@noisy.programming.kicks-ass.net>
References: <20260213-page-volatile-io-v3-1-d60487b04d40@kernel.org>
 <aY9i8rbvnxdOA9DV@tardis.local>
 <20260217085541.GS1395266@noisy.programming.kicks-ass.net>
 <102c86dd6fb1a907b7138a437dee00dc@garyguo.net>
 <aZRHJ22UtG1YeBMj@willie-the-truck>
 <aZShEW2b9-71r18I@tardis.local>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aZShEW2b9-71r18I@tardis.local>

On Tue, Feb 17, 2026 at 09:10:42AM -0800, Boqun Feng wrote:

> We are worried about two racing memcpy()s end up being data race and
> that's undefined behavior. And "atomic" is the key word in C (and Rust)
> to "lift" normal accesses to non-data-race, for example:

I hate people for calling that atomic. It has nothing to do with
atomics.

> 
> 	thread 1		thread 2
> 	--------		--------
>     	*a = 1;			r1 = *a;
> 
> is data race, and 
> 
> 	thread 1		thread 2
> 	--------		--------
>     	atomic_store(a,1);	r1 = atomic_load(a);
> 
> is not.

At the end of the day, they're both the bloody same thing, no matter
what you call them :-( All this UB nonsense is just compiler people
being silly.

> In memcpy() case, since we don't need the whole copy to be a single
> atomic operation, so as long as the atomicity is guaranteed at byte
> level (larger is fine because 2byte atomic is still byte atomic), it
> should be sufficient as a concurrent-safe memcpy().

But this is every memcpy(), ever :/

> So either we want to live in a world where
> 
> "concurrent normal accesses with at least one being write are data race
> therefore UBs, use the corresponding atomic API in this case and handle
> the data carefully with concurrent accesses in mind".
> 
> or we want to live in a world where
> 
> "concurrent normal accesses with at least one being write are data race
> therefore UBs, but there are 17 and more API which are technically UBs,
> but they are not considered as UBs in kernel, use them"
> 
> To me, having a atomic_bytewise_memcpy() at least clear things out about
> what is actually needed (at the very minimal) to have a concurrent-safe
> memcpy().

I'm still not seeing what it does over any other memcpy(), except you
created one more API, so now we have 18 :-(

> Moving forward, since the concept has been already somehow
> proposed to C/C++, it's likely to be standardized (we can push it from
> the kernel end as well) so we don't need to implement a concurrent-safe
> memcpy() for all architectures on our own.
> 
> Hope this makes some sense ;-)

I'm still not seeing it. All memcpy() implementations are already
meeting the criteria you want. There is nothing to implement. And I
really don't see the point in creating: magical_memcpy() that is
*identical* to every other memcpy() we already have.

AFAICT the only problem here is that from:

  https://lkml.kernel.org/r/20260218083754.GB2995752@noisy.programming.kicks-ass.net


