Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3084A7262A
	for <rust-for-linux@vger.kernel.org>; Fri,  2 Jan 2026 12:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767357245; cv=none; b=HJbE66LDsvJtM6ZXuce2llmCUiQR8Ka9swX51w1lwmSxyGGdw/qLTb6GbPY+3cg0AYzfBYwLJRHP8Y26pbTpK3F7Y7zuFWqRYvH3quir2hCl2kt9YrU3grWc8+nCHKKZhSXcOB8KbnYcIejfG+/fSHzSWwSr+PSf0BHJ9Jz+OYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767357245; c=relaxed/simple;
	bh=f0Fa3TQlUP+rnNHqjqLz/+Cz1gK+lWi70jEDeKjbIfE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=j2g6FwgK8/NDu0Cd9WqiBLH/stgueMMKVoy+0RcKo/IWlhcTZPLcGkRveOLS+EREp3726GB5dvwaNAg41p0wX79RY4Lq06vklUJwyHkLiMM3KrDLT9/Or+gBJy/BpgHm2k3ypB+UWmQ9WHmxiGCk3huMNY/ZHW6sUsWW9eTK2/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E38s1Wi+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E38s1Wi+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13703C116B1;
	Fri,  2 Jan 2026 12:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767357243;
	bh=f0Fa3TQlUP+rnNHqjqLz/+Cz1gK+lWi70jEDeKjbIfE=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=E38s1Wi+doeOo0OWzVqzjCJcwkQ+RLq6bpGGyzUKDC/7KqlTKuHEBW+pTMsNw3hEX
	 KR8SJ8mj2qPL0lW1IOrQnV4v1bZ2g84xDD98psJoDkhjNdoD645iUgxs6wIKXVvRlj
	 jveCFhXOJTa63+Tsa704PKFtZm06L5tPSSvH2AhKXYHpuMmlEN8QBJ4lWtX0nAc5CF
	 7+F1t/BfJEWmmg/Q40TM/fD+47Yt6yYVN8rm/PRLLv41gPRt+/WcOut3X765Dd37OB
	 WGkknEQI8nkDOgbz+l9VVgubHlp3pnIUXSO/YnstMl3ZgaXbZnpK+kXgy46FZlP8Gh
	 e84/sw9l+2Baw==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 02 Jan 2026 13:33:58 +0100
Message-Id: <DFE3UQOFLT3S.F3KUNPIXSAPW@kernel.org>
Subject: Re: [PATCH v8 2/4] rust: kernel: Add pointer wrapper types for safe
 pointer formatting
Cc: "Dirk Behme" <dirk.behme@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Petr Mladek"
 <pmladek@suse.com>, "Steven Rostedt" <rostedt@goodmis.org>, "Timur Tabi"
 <ttabi@nvidia.com>, "Benno Lossin" <lossin@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "John Ogness" <john.ogness@linutronix.de>, "Rasmus
 Villemoes" <linux@rasmusvillemoes.dk>, "Andrew Morton"
 <akpm@linux-foundation.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Tamir Duberstein" <tamird@gmail.com>, "Ke Sun" <sk.alvin.x@gmail.com>,
 <rust-for-linux@vger.kernel.org>
To: "Ke Sun" <sunke@kylinos.cn>, "Andy Shevchenko"
 <andriy.shevchenko@linux.intel.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260101081605.1300953-1-sunke@kylinos.cn>
 <20260101081605.1300953-3-sunke@kylinos.cn>
 <aVe3R9_Jz-eOFJ6U@smile.fi.intel.com>
In-Reply-To: <aVe3R9_Jz-eOFJ6U@smile.fi.intel.com>

On Fri Jan 2, 2026 at 1:17 PM CET, Andy Shevchenko wrote:
> On Thu, Jan 01, 2026 at 04:16:02PM +0800, Ke Sun wrote:
>> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
> Definitely wrong tag here. Please, do not apply random tags on behalf of
> others. You must get it explicitly.

Ke, just to avoid any confusion, it also strongly depends on the situation.

There are tags that are commonly used without getting it explicitly;
'Reported-by:' for instance.

For the 'Suggested-by:' tag it depends, if the situation is 100% clear it i=
s not
uncommon to just add the tag, but in general - but especially if in doubt -=
 it
is usually better to ask.

It also sometimes happens that maintainers convert a "LGTM" or "I agree wit=
h
this patch.", etc. to an 'Acked-by:'. This sometimes happens with new
contributors, but in general 'Acked-by:' is (and should be) given explicitl=
y.

For things like 'Suggested-by:' I also recommend to add a 'Link:' tag with =
the
source of the suggestion.

Please also have a look at [1], which explains which tags require permissio=
n.

I hope this helps!

- Danilo

[1] https://docs.kernel.org/process/submitting-patches.html#tagging-people-=
requires-permission
